import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response dataResponse = await http.get(Uri.parse(url));
    //print(dataResponse.statusCode);

    if (dataResponse.statusCode == 200) {
      String data = dataResponse.body;

      return jsonDecode(data);

    } else {
      print(dataResponse.statusCode);
    }
  }
}