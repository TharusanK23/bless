library mainviewmodel;

import 'package:bless/routes/index.dart';

class CartViewModel extends BaseViewModel {
  final ProductController _productController = Get.find();
  final List<dynamic> _basketItems = [];
  
  List<dynamic> get basketItems => _basketItems;
  ProductController get productController => _productController;

  Future<void> initialise(BuildContext context) async {}

void changeQty(int type) {
    // if (type == 1) {
    //   product.qty++;
    // } else {
    //   if (_qty > 1) {
    //     _qty--;
    //   }
    // }
    notifyListeners();
  }

  deleteProduct(BuildContext context) {
    notifyListeners();
  }

  navigateToHomeView(BuildContext context) {
     Navigator.of(context).pushNamed(HomeView.routeName);
    notifyListeners();
  }
}
