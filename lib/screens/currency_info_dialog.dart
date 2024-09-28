// import 'package:currency_converter/model/currency_info_model.dart';
// import 'package:flutter/material.dart';

// class CurrencyInfoDialog extends StatelessWidget {
//   final CurrencyInfo currencyInfo;

//   const CurrencyInfoDialog({super.key, required this.currencyInfo});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(currencyInfo.abbreviation),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Symbol: ${currencyInfo.symbol}'),
//           Text('Country: ${currencyInfo.country}'),
//         ],
//       ),
//       actions: [
//         TextButton(
//           child: const Text('Close'),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     );
//   }
// }


import 'package:currency_converter/model/currency_info_model.dart';
import 'package:flutter/material.dart';

class CurrencyInfoBottomSheet extends StatelessWidget {
  final CurrencyInfo currencyInfo;

  const CurrencyInfoBottomSheet({super.key, required this.currencyInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currencyInfo.abbreviation,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          Text('Symbol: ${currencyInfo.symbol}'),
          Text('Country: ${currencyInfo.country}'),
          const SizedBox(height: 20.0),
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
