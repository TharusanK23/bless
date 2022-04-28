library splashview;

import 'package:bless/routes/index.dart';
import 'package:flutter/cupertino.dart';

//Part
part 'package:bless/screens/splash/body/splash.body.dart';

class SplashView extends StatelessWidget {
  static const routeName = '/splash-view';
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        builder: (context, model, child) {
          return const Scaffold(
            backgroundColor: secondary,
            body: SafeArea(child: _SplashBody()),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => SplashViewModel());
  }
}
