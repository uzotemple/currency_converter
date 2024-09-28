import 'package:currency_converter/model/currency_info_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _defaultFromCurrency = 'USD';
  String _defaultToCurrency = 'EUR';
  int _decimalPrecision = 2;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Load the saved preferences
  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _defaultFromCurrency = prefs.getString('defaultFromCurrency') ?? 'USD';
      _defaultToCurrency = prefs.getString('defaultToCurrency') ?? 'EUR';
      _decimalPrecision = prefs.getInt('decimalPrecision') ?? 2;
    });
  }

  // Save preferences to SharedPreferences
  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('defaultFromCurrency', _defaultFromCurrency);
    prefs.setString('defaultToCurrency', _defaultToCurrency);
    prefs.setInt('decimalPrecision', _decimalPrecision);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Settings', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Currency Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Default From Currency'),
              trailing: DropdownButton<String>(
                value: _defaultFromCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    _defaultFromCurrency = newValue!;
                  });
                  _saveSettings(); // Save preference
                },
                items: currencyList.map<DropdownMenuItem<String>>((CurrencyInfo currency) {
                  return DropdownMenuItem<String>(
                    value: currency.abbreviation,
                    child: Text(currency.abbreviation),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Default To Currency'),
              trailing: DropdownButton<String>(
                value: _defaultToCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    _defaultToCurrency = newValue!;
                  });
                  _saveSettings(); // Save preference
                },
                items: currencyList.map<DropdownMenuItem<String>>((CurrencyInfo currency) {
                  return DropdownMenuItem<String>(
                    value: currency.abbreviation,
                    child: Text(currency.abbreviation),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Conversion Precision (Decimal Places)'),
              trailing: DropdownButton<int>(
                value: _decimalPrecision,
                onChanged: (int? newValue) {
                  setState(() {
                    _decimalPrecision = newValue!;
                  });
                  _saveSettings(); // Save preference
                },
                items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save and Close'),
            ),
          ],
        ),
      ),
    );
  }
}
