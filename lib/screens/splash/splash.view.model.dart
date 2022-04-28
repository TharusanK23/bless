import 'package:bless/routes/index.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> initialise({required BuildContext context}) async {
    Future.delayed(const Duration(milliseconds: 5000), () {
     Navigator.of(context).pushNamedAndRemoveUntil(HomeView.routeName, (Route<dynamic> route) => false);
    });
  }
}
