import 'dart:convert';

import 'package:currency_converter/theme/theme.dart';
import 'package:currency_converter/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // final bool isDarkMode = false;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double inputAmount = 0.0;
  String result = '';

  Future<void> convertCurrency() async {
    // Using the provided API URL
    String url =
        'https://v6.exchangerate-api.com/v6/53c42c7f2572125597737b6c/latest/$fromCurrency';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double rate = data['conversion_rates'][toCurrency];
        setState(() {
          result = (inputAmount * rate).toStringAsFixed(2);
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

  @override
Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text('Currency Converter'),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('From'),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  fromCurrency = newValue!;
                });
              },
              items: <String>[
                'USD', 'EUR', 'GBP', 'NGN', 'JPY', 'AUD', 'CAD', 'CHF', 
                'CNY', 'SEK', 'NZD', 'INR', 'BRL', 'ZAR', 'RUB', 'SGD', 
                'HKD', 'MXN', 'TRY', 'KRW', 'AED', 'SAR', 'THB', 'PLN', 
                'MYR', 'ILS', 'NOK', 'DKK', 'HUF', 'CZK', 'IDR', 'PHP', 
                'EGP', 'VND', 'CLP', 'ARS', 'COP', 'PEN', 'KWD', 'OMR', 
                'QAR', 'BHD', 'TWD', 'MAD', 'PKR', 'BDT', 'LKR', 'BGN', 
                'RON', 'HRK', 'UYU', 'GHS',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text('To'),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  toCurrency = newValue!;
                });
              },
              items: <String>[
                'USD', 'EUR', 'GBP', 'NGN', 'JPY', 'AUD', 'CAD', 'CHF', 
                'CNY', 'SEK', 'NZD', 'INR', 'BRL', 'ZAR', 'RUB', 'SGD', 
                'HKD', 'MXN', 'TRY', 'KRW', 'AED', 'SAR', 'THB', 'PLN', 
                'MYR', 'ILS', 'NOK', 'DKK', 'HUF', 'CZK', 'IDR', 'PHP', 
                'EGP', 'VND', 'CLP', 'ARS', 'COP', 'PEN', 'KWD', 'OMR', 
                'QAR', 'BHD', 'TWD', 'MAD', 'PKR', 'BDT', 'LKR', 'BGN', 
                'RON', 'HRK', 'UYU', 'GHS',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputAmount = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20.0),
            Text(
              result,
              style: const TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Switch to Dark Mode'),
                ),
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    value: themeProvider.themeData == darkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}
