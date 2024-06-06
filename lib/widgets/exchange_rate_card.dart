import 'package:flutter/material.dart';

class ExchangeRateCard extends StatelessWidget {
  const ExchangeRateCard(
      {super.key,
      required this.exchangeRate,
      required this.cryptoSymbol,
      required this.currency});

  final String exchangeRate;
  final String cryptoSymbol;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoSymbol = $exchangeRate $currency',
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
