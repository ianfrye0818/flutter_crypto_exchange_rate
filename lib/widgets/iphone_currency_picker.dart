import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/coin_data.dart';

class IphoneCurrencyPicker extends StatelessWidget {
  const IphoneCurrencyPicker(
      {super.key, required this.currentCurrency, required this.onChanged});

  final String currentCurrency;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: Colors.lightBlue,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6),
              color: Colors.lightBlue,
              child: SafeArea(
                top: false,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                      initialItem: currenciesList.indexOf(currentCurrency)),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (selectedIndex) {
                    onChanged(currenciesList[selectedIndex]);
                  },
                  children: currenciesList
                      .map((item) => Text(
                            item,
                            style: const TextStyle(color: Colors.white),
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        },
        child: Text(currentCurrency));
  }
}
