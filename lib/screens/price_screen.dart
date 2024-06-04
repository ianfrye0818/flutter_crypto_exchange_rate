import 'package:bitcoin_ticker/constants/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = currenciesList[0];

  List<DropdownMenuItem> menu = currenciesList
      .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // child: null,
            child: DropdownButton(
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
                setState(() {
                  currentCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
