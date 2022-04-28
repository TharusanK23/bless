part of cartview;

class _CartPriceDetails extends ViewModelWidget<CartViewModel> {
  const _CartPriceDetails({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, CartViewModel model) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total',
                  style: TextStyle(
                    color: dark,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rs ' + model.productController.productTotal,
                  style: const TextStyle(
                    color: dark,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
