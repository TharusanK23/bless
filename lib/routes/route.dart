import 'package:bless/routes/index.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SplashView.routeName: (context) => const SplashView(),
    HomeView.routeName: (context) => const HomeView(),
    ProductView.routeName: (context) => const ProductView(),
    CartView.routeName: (context) => const CartView()
  };
}
