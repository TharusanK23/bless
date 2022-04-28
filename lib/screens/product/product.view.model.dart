import 'package:bless/routes/index.dart';

class ProductViewModel extends BaseViewModel {
  final ProductController _productController = Get.put(ProductController());
  final ProductController _findProductController = Get.find();
  ProductViewArqument? _productViewArqument;
  late Product _product;

  ProductViewArqument? get productViewArqument => _productViewArqument;
  Product get product => _product;
  ProductController get productController => _productController;
  ProductController get findProductController => _findProductController;

  Future<void> initialise({required BuildContext context}) async {
    _productViewArqument = ModalRoute.of(context)!.settings.arguments as ProductViewArqument;
    _product = _productViewArqument!.product!;
    notifyListeners();
  }

  void makeFavorite(BuildContext context) {
    _productController.makeFavorite(product);
    notifyListeners();
  }

  void navigateToBasketView(BuildContext context) {
    Navigator.of(context).pushNamed(CartView.routeName);
    notifyListeners();
  }

  void addToCart(BuildContext context,) {
    _productController.addProduct(_product, false);
    notifyListeners();
  }
}
