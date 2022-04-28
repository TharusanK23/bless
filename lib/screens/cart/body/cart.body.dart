part of cartview;

class _CartBody extends ViewModelWidget<CartViewModel> {
  const _CartBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, CartViewModel model) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: (() => Navigator.pop(context)),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: dark,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'images/logo/bless-logo-2.png',
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const <Widget>[
                  Text(
                    'Shopping Cart',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(
                () => model.productController.products.length != 0
                    ? Flexible(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: const <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            _CartItems(),
                            _CartPriceDetails(),
                            SizedBox(
                              height: 75.0,
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/2748/2748558.png',
                              height: 150.0,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Your cart is currently\nEmpty!',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.2, fontSize: 30.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
              )
            ],
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: AppButton(
                  onPressed: () => model.productController.products.length == 0 ? model.navigateToHomeView(context) : null,
                  title: model.productController.products.length == 0 ? 'Brows Items' : "Checkout",
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
