library productview;

import 'package:bless/routes/index.dart';

//Part
part 'package:bless/screens/product/body/product.body.dart';

class ProductView extends StatelessWidget {
  static const routeName = '/product-view';
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: secondary,
            body: const SafeArea(child: _ProductBody()),
            appBar: AppBar(
                backgroundColor: secondary,
                elevation: 0.0,
                leading: GestureDetector(
                  onTap: () => model.goBack(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: dark,
                  ),
                ),
                actions: [
                  const Icon(
                    Icons.share,
                    color: dark,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () => model.makeFavorite(context),
                    child: Icon(
                      model.product.isLiked! ? Icons.favorite : Icons.favorite_border,
                      color: model.product.isLiked! ? error : dark,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () => model.navigateToBasketView(context),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'http://cdn.onlinewebfonts.com/svg/img_116081.png',
                              width: 22.0,
                            ),
                          ],
                        ),
                        Obx(() => Positioned(
                            top: 5.0,
                            right: 0.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: error, borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                model.findProductController.products.length.toString(),
                                style: const TextStyle(color: white),
                              ),
                            )))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        model.product.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: dark,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
                centerTitle: false),
          );
        },
        onModelReady: (model) {
          model.initialise(context: context);
        },
        viewModelBuilder: () => ProductViewModel());
  }
}
