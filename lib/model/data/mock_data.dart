import 'package:crypto_app/model/crypto_data.dart';

class MockDataRepo implements CryptoRepo {
  @override
  Future<List<CryptoData>> fetchCurrenciesFromCryptoApi() {
    // TODO: implement fetchCurrenciesFromCryptoApi
    return Future.value(currencies);
  }
}

var currencies = <CryptoData>[
  CryptoData(
      symbol: "BNBBTC", priceChange: "0.00028500", lastPrice: "0.01027100"),
  CryptoData(
      symbol: "NEOBTC", priceChange: "-0.00000500", lastPrice: "0.00070100"),
  CryptoData(
      symbol: "QTUMETH", priceChange: "-0.00009200", lastPrice: "0.00347200"),
];
