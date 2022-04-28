part of cartview;

class _CartItems extends ViewModelWidget<CartViewModel> {
  const _CartItems({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, CartViewModel model) {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model.productController.products.length,
          itemBuilder: (context, index) {
            Product product = model.productController.products.keys.toList()[index];
            dynamic qty = model.productController.products.values.toList()[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.1), offset: const Offset(3, 6))],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: light,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            )),
                        child: Image.network(
                          product.image!,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        product.model!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          product.name!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  (product.price! * qty).toStringAsFixed(2),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: primary),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () => model.productController.removeProduct(product),
                                          borderRadius: BorderRadius.circular(18),
                                          highlightColor: transparent,
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.2), offset: const Offset(2, 4))],
                                              ),
                                              child: const Icon(Icons.remove))),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Text(
                                          qty.toString(),
                                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () => model.productController.addProduct(product, true),
                                          borderRadius: BorderRadius.circular(18),
                                          highlightColor: transparent,
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.2), offset: const Offset(2, 4))],
                                              ),
                                              child: const Icon(Icons.add))),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () => model.productController.deleteProduct(product),
                                    child: const Icon(
                                      Icons.delete,
                                      color: error,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          }),
    );
  }
}
