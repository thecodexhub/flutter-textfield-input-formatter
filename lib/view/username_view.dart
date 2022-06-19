import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsernameView extends StatelessWidget {
  const UsernameView({Key? key}) : super(key: key);

  static const List<String> _rules = [
    '* Any alphabet and number is allowed.',
    '* Username can\'t start with number.',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Username Formatter',
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
              prefix: Text('@'),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]*")),
              FilteringTextInputFormatter.deny(RegExp(r"^[0-9]")),
            ],
          ),
        ],
      ),
    );
  }
}
