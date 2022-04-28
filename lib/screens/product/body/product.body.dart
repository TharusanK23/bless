part of productview;

class _ProductBody extends ViewModelWidget<ProductViewModel> {
  const _ProductBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, ProductViewModel model) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          color: secondary,
          child: CachedNetworkImage(
            color: secondary,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.60,
            width: double.infinity,
            colorBlendMode: BlendMode.modulate,
            imageUrl: model.product.image!,
            placeholder: (context, url) => Center(
              child: SvgPicture.asset(
                'images/svg/placeholder.svg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.60,
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: SvgPicture.asset(
                'images/svg/placeholder.svg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.60,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.1), offset: const Offset(6, 3))],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    model.product.model!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30.0,
                      color: dark.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Text(
                        model.product.brand!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Rs ' + model.product.price!.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Text(
                        model.product.colour!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Text(
                        'Weight',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Text(
                        model.product.weight!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: dark.withOpacity(0.6),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              AppButton(
                onPressed: () => model.addToCart(context),
                title: "Add to Cart",
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
        )
      ],
    );
  }
}
