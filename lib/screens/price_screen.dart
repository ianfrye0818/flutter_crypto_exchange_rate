import 'package:bitcoin_ticker/exchange_rate_dto.dart';
import 'package:bitcoin_ticker/constants/coin_data.dart';
import 'package:bitcoin_ticker/secrets/secrets.dart';
import 'package:bitcoin_ticker/widgets/exchange_rate_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/debouncer.dart';
import '../widgets/bottom_picker.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = currenciesList[0];
  double exchangeRate = 0.0;

  Map<String, double> exchangeRateMap = {};
  bool isLoading = false;

  final debouncer = Debouncer(const Duration(milliseconds: 1000));

  void onCurrencyChanged(String value) {
    debouncer.cancel();

    setState(() {
      isLoading = true;
      currentCurrency = value;
    });

    debouncer(() {
      setState(() {
        getExchangeRate();
      });
    });
  }

  void getExchangeRate() async {
    final headers = {'X-CoinAPI-Key': SecretKeys.CRYPTO_API_KEY};
    for (String crypto in cryptoList) {
      final url =
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currentCurrency';
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = exchangeRateDtoFromJson(response.body);
        setState(() {
          exchangeRateMap[crypto] = data.rate;
        });
        isLoading = false;
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to get exchange rate!'),
              showCloseIcon: true,
              duration: Duration(seconds: 5),
              dismissDirection: DismissDirection.down,
            ),
          );
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

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
            child: ListView.builder(
              addRepaintBoundaries: true,
              shrinkWrap: true,
              itemCount: cryptoList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: ExchangeRateCard(
                      exchangeRate: exchangeRateMap[cryptoList[index]]
                              ?.toStringAsFixed(2) ??
                          '?',
                      cryptoSymbol: cryptoList[index],
                      currency: currentCurrency),
                );
              },
            ),
          ),
          BottomPicker(
            currentCurrency: currentCurrency,
            onCurrencyChanged: onCurrencyChanged,
          ),
        ],
      ),
    );
  }
}
