import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberView extends StatelessWidget {
  const CardNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Credit Card Number Formatter',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 24.0),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '0123 4567 8901 2345',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              CardNumberFormatter(),
            ],
          ),
        ],
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  final sampleNumber = '0000 0000 0000 0000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      // If newly entered text length exceeds sample number's length
      // then return the old value.
      if (newValue.text.length > sampleNumber.length) {
        return oldValue;
      }

      // Check if the recently entered character is a digit or not.
      final lastEnteredLetter =
          newValue.text.substring(newValue.text.length - 1);
      if (!RegExp(r'[0-9]').hasMatch(lastEnteredLetter)) {
        return oldValue;
      }

      // If the index of the last entered character in the `newValue`
      // is n, and in the n-th index of the sampleNumber there is a
      // separator, then modify the text.
      if (newValue.text.isNotEmpty &&
          sampleNumber[newValue.text.length - 1] == ' ') {
        return TextEditingValue(
          text:
              '${oldValue.text} ${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
    }
    return newValue;
  }
}
