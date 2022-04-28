import 'package:bless/routes/index.dart';

class ProductController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product, bool isUpdate) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    if (!isUpdate) {
      Get.snackbar('Product Added', 'You have added the ${product.model!.toUpperCase()} to the cart!',
          backgroundColor: success, snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  void deleteProduct(Product product) {
    _products.remove(product);
    Get.snackbar('Product Deleted', 'You have deleted the ${product.model!.toUpperCase()} from the cart!',
        backgroundColor: error, snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
  }

  void makeFavorite(Product product) {
    product.isLiked = !product.isLiked!;
    if (product.isLiked!) {
      Get.snackbar('Product is Favorited', 'You have favorited the ${product.model!.toUpperCase()} product!',
          snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
  }

  get products => _products;

  get productSubTotal => _products.entries.map((product) => product.key.price * product.value).toList();

  get productTotal =>
      _products.entries.map((product) => product.key.price * product.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
}
