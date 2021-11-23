import 'package:crypto_app/model/crypto_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductionDataRepo implements CryptoRepo {
  String cryptoUrl = "https://api2.binance.com/api/v3/ticker/24hr";

  @override
  Future<List<CryptoData>> fetchCurrenciesFromCryptoApi() async {
    // TODO: implement fetchCurrenciesFromCryptoApi
    http.Response response = await http.get(Uri.parse(cryptoUrl));
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataExceptionError(
          "An error occured: [Status Code: $statusCode]");
    }
    return responseBody.map((e) => CryptoData.fromMap(e)).toList();
  }
}
