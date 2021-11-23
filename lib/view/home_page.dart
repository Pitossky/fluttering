import 'package:crypto_app/model/crypto_data.dart';
import 'package:crypto_app/presenter/crypto_presenter.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CryptoPresenter {
  CryptoDataPresenter? _presenter;
  List<CryptoData>? _currencies;
  final List<MaterialColor> _colorList = [
    Colors.deepPurple,
    Colors.purple,
    Colors.deepOrange
  ];

  _MyHomePageState() {
    _presenter = CryptoDataPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter!.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoCurrency App'),
      ),
      body:
          _cryptoWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, int index) {
                final CryptoData currency = _currencies![index];
                final MaterialColor color =
                    _colorList[index % _colorList.length];

                return _getItemList(currency, color);
              },
              itemCount: _currencies!.length,
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getItemList(CryptoData currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency.symbol[0]),
      ),
      title: Text(
        currency.symbol,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency.priceChange, currency.lastPrice),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceChange, String lastPrice) {
    TextSpan priceChangeWidget = TextSpan(
      text: "price change: \$$priceChange\n",
      style: TextStyle(color: Colors.black87),
    );
    String lastPriceText = "last price: \$$lastPrice\n";
    TextSpan lastPriceWidget;

    if (double.parse(lastPrice) > 0) {
      lastPriceWidget = TextSpan(
        text: lastPriceText,
        style: TextStyle(color: Colors.green),
      );
    } else {
      lastPriceWidget = TextSpan(
        text: lastPriceText,
        style: TextStyle(color: Colors.red),
      );
    }

    return RichText(
      text: TextSpan(
        children: [priceChangeWidget, lastPriceWidget],
      ),
    );
  }

  @override
  void dataDownloadError() {
    // TODO: implement dataDownloadError
  }

  @override
  void downloadedData(List<CryptoData> items) {
    // TODO: implement downloadedData
    setState(() {
      _currencies = items;
    });
  }
}
