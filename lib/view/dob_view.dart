import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DOBView extends StatelessWidget {
  const DOBView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Date of Birth Formatter',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 24.0),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'DD/MM/YYYY',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              DOBFormatter(),
            ],
          ),
        ],
      ),
    );
  }
}

class DOBFormatter extends TextInputFormatter {
  final sampleValue = '01/01/2000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      // If the new value length exceeds the sample value length
      // return the old value;
      if (newValue.text.length > sampleValue.length) {
        return oldValue;
      }

      // Check if the recently entered character is a digit or not.
      final lastEnteredLetter = newValue.text[newValue.text.length - 1];
      if (!RegExp(r'[0-9]').hasMatch(lastEnteredLetter)) {
        return oldValue;
      }

      // If the next index place is a separator, then modify the
      // text editing value.
      if (sampleValue.length != newValue.text.length &&
          sampleValue[newValue.text.length] == '/') {
        final lastTwoDigits = newValue.text.substring(newValue.text.length - 2);
        String? modifiedString;

        if (newValue.text.length == 2) {
          int value = int.parse(lastTwoDigits);
          if (value > 31) {
            value = value ~/ 10;
            modifiedString = '0$value';
          }
        }

        if (newValue.text.length == 5) {
          int value = int.parse(lastTwoDigits);
          if (value > 12) {
            value = value ~/ 10;
            modifiedString =
                '${newValue.text.substring(0, newValue.text.length - 2)}0$value';
          }
        }

        return TextEditingValue(
          text: '${modifiedString ?? newValue.text}/',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
    }

    return newValue;
  }
}
