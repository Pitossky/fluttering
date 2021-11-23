class CryptoData {
  String symbol;
  String priceChange;
  String lastPrice;

  CryptoData(
      {required this.symbol,
      required this.priceChange,
      required this.lastPrice});

  CryptoData.fromMap(Map<String, dynamic> map)
      : symbol = map['symbol'],
        priceChange = map['priceChange'],
        lastPrice = map['lastPrice'];
}

abstract class CryptoRepo {
  Future<List<CryptoData>> fetchCurrenciesFromCryptoApi();
}

class FetchDataExceptionError implements Exception {
  final _message;
  FetchDataExceptionError([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
