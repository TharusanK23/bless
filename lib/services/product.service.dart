import 'package:bless/routes/index.dart';

class ProductService {
  static Future<dynamic> getAllProducts() async {
    final response = await get('919a0d45-c054-4452-8175-65538e554272');
    return json.decode(response.body);
  }
}