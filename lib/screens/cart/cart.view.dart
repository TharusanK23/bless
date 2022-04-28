library cartview;

import 'package:bless/routes/index.dart';

//Part
part 'package:bless/screens/cart/body/cart.body.dart';
part 'package:bless/screens/cart/body/cart.items.dart';
part 'package:bless/screens/cart/body/cart.price-details.dart';

class CartView extends StatelessWidget {
  static const routeName = '/cart-view';
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        builder: (context, model, child) {
          return const Scaffold(
            backgroundColor: white,
            body: SafeArea(child: _CartBody()),
          );
        },
        onModelReady: (model) {
          model.initialise(context);
        },
        viewModelBuilder: () => CartViewModel());
  }
}
