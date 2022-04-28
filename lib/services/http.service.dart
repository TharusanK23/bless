import 'package:http/http.dart' as http;

const String baseUrl = 'https://run.mocky.io/v3/';

get(String url) async {
  var getUrl = Uri.parse(baseUrl + url);
  final getUrlWithParam = http.get(getUrl);
  return getUrlWithParam.then((res) async {
    return res;
  });
}