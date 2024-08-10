// import 'package:currency_converter/screens/currency_converter.dart';
import 'package:currency_converter/screens/currency_converter.dart';
// import 'package:currency_converter/theme/theme.dart';
import 'package:currency_converter/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CurrencyConverterApp(),
    ),
  );
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.light,

      // ),
      theme: Provider.of<ThemeProvider>(context).themeData, // Apply the light theme
      // darkTheme: darkMode, // Apply the dark theme
      // themeMode: ThemeMode.system, // Use system theme mode
      home: const CurrencyConverter(),
    );
  }
}
