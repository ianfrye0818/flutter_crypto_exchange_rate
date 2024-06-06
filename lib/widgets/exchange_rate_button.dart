import 'package:flutter/material.dart';

class ExchangeRateButton extends StatelessWidget {
  const ExchangeRateButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            minimumSize: MaterialStateProperty.all(const Size(200.0, 50.0)),
          ),
          child: const Text(
            'Get Exchange Rate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
