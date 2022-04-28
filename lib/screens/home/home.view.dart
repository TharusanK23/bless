library homeview;

import 'package:bless/routes/index.dart';
import 'package:flutter/cupertino.dart';
//Part
part 'package:bless/screens/home/body/home.body.dart';
part 'package:bless/screens/home/body/home.categories.dart';
part 'package:bless/screens/home/body/home.search-view.dart';
part 'package:bless/screens/home/body/home.product-list.dart';


class HomeView extends StatelessWidget {
  static const routeName = '/home-view';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) {
          return const Scaffold(
            backgroundColor: secondary,
            body: SafeArea(child: _HomeBody()),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
