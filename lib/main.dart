import 'package:bitcoin_ticker/constants/theme.dart';
import 'package:bitcoin_ticker/screens/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BitCoinTrackerApp());
}

class BitCoinTrackerApp extends StatelessWidget {
  const BitCoinTrackerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: PriceScreen(),
    );
  }
}
