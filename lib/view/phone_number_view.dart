import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({Key? key}) : super(key: key);

  static const List<String> _rules = [
    '* Only digits are allowed.',
    '* Can not exceed 10 digits',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Phone Number Formatter',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _rules.map((rule) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  rule,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24.0),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
          ),
        ],
      ),
    );
  }
}
