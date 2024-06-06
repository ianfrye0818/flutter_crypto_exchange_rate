import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'android_currency_picker.dart';
import 'iphone_currency_picker.dart';

class BottomPicker extends StatelessWidget {
  const BottomPicker(
      {super.key,
      required this.currentCurrency,
      required this.onCurrencyChanged});

  final String currentCurrency;
  final ValueChanged<String> onCurrencyChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: Platform.isIOS
          ? IphoneCurrencyPicker(
              currentCurrency: currentCurrency, onChanged: onCurrencyChanged)
          : AndroidCurrencyPicker(
              currentCurrency: currentCurrency, onChanged: onCurrencyChanged),
    );
  }
}
