import 'package:flutter/material.dart';

import '../constants/coin_data.dart';

class AndroidCurrencyPicker extends StatelessWidget {
  AndroidCurrencyPicker(
      {super.key, required this.currentCurrency, required this.onChanged});

  final String currentCurrency;
  final void Function(String) onChanged;

  final List<DropdownMenuItem> menu = currenciesList
      .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        iconSize: 30,
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Colors.white,
        ),
        style: const TextStyle(color: Colors.white, fontSize: 22),
        dropdownColor: Colors.blueGrey,
        value: currentCurrency,
        items: menu,
        onChanged: (value) {
          onChanged(value);
        });
  }
}
