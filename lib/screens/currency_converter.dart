import 'dart:convert';

import 'package:currency_converter/model/currency_info_model.dart';
// import 'package:currency_converter/screens/currency_info_dialog.dart';
import 'package:currency_converter/screens/settings_page.dart';
import 'package:currency_converter/theme/theme.dart';
import 'package:currency_converter/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double inputAmount = 0.0;
  String result = '';

  Future<void> convertCurrency() async {
    String url =
        'https://v6.exchangerate-api.com/v6/53c42c7f2572125597737b6c/latest/$fromCurrency';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double rate = data['conversion_rates'][toCurrency];
        String currencySymbol = currencyList
            .firstWhere((currency) => currency.abbreviation == toCurrency)
            .symbol; // Get the symbol of the selected currency

            // Format the converted amount
        double convertedAmount = inputAmount * rate;
        String formattedAmount = NumberFormat.currency(symbol: currencySymbol, decimalDigits: 2).format(convertedAmount);


        setState(() {
          result = formattedAmount; // Include the currency symbol
        });
      } else {
        throw Exception('Failed to load exchange rate');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  void showCurrencyInfo(BuildContext context, CurrencyInfo currencyInfo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the sheet to take the full height of the screen
      builder: (BuildContext context) {
        return Container(
          width: double
              .infinity, // This makes the bottom sheet take the full width
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensures the column takes minimum height
            children: [
              Text(
                'Details about ${currencyInfo.abbreviation}', // Example content
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15.0),
              Text(
                currencyInfo.abbreviation, // Example content
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Country: ${currencyInfo.country}', // Example content
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Symbol: ${currencyInfo.symbol}', // Example content
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15.0),
              // Add more widgets as needed
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Currency Converter',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton<int>(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onSelected: (value) {
              if (value == 0) {
                themeProvider.toggleTheme();
              } else if (value == 1) {
                convertCurrency();
              } else if (value == 2) {
                showAboutDialog(
                  context: context,
                  applicationName: 'Currency Converter',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.monetization_on),
                  children: [
                    const Text(
                      'This app converts currency rates in real-time using an API.',
                    ),
                  ],
                );
              } else if (value == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Dark Mode'),
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                        value: themeProvider.themeData == darkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 18),
                    SizedBox(width: 10),
                    Text('Refresh Rates'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 18),
                    SizedBox(width: 10),
                    Text('About'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 18),
                    SizedBox(width: 10),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/currency.webp'),

              Text('From', style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
              ),),
              DropdownButton<String>(
                value: fromCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    fromCurrency = newValue!;
                  });
                  CurrencyInfo selectedCurrency = currencyList.firstWhere(
                      (currency) => currency.abbreviation == newValue);
                  showCurrencyInfo(context, selectedCurrency);
                },
                items: currencyList
                    .map<DropdownMenuItem<String>>((CurrencyInfo currency) {
                  return DropdownMenuItem<String>(
                    value: currency.abbreviation,
                    child: Text(currency.abbreviation),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
               Text('To', style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
              ),),
              DropdownButton<String>(
                value: toCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    toCurrency = newValue!;
                  });
                  CurrencyInfo selectedCurrency = currencyList.firstWhere(
                      (currency) => currency.abbreviation == newValue);
                  showCurrencyInfo(context, selectedCurrency);
                },
                items: currencyList
                    .map<DropdownMenuItem<String>>((CurrencyInfo currency) {
                  return DropdownMenuItem<String>(
                    value: currency.abbreviation,
                    child: Text(currency.abbreviation),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: const TextStyle(
                      color: Colors.blueGrey), // Change label color
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.grey, width: 2.0), // Border when enabled
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0), // Border when focused
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red, width: 2.0), // Border when error
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 2.0), // Border when focused with error
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  filled: true, // Fill the background
                  fillColor: Colors.white, // Background color
                  hintText: 'Enter amount', // Hint text
                  hintStyle:
                      const TextStyle(color: Colors.grey), // Hint text color
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0), // Padding inside the TextField
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  inputAmount = double.tryParse(value) ?? 0.0;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: convertCurrency,
                  child: const Text('Convert', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              const SizedBox(height: 20.0),
              // Container for the result
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Conversion Result:',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      result.isEmpty ? 'No result' : result,
                      style: const TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
