part of homeview;

class _HomeProductList extends ViewModelWidget<HomeViewModel> {
  const _HomeProductList({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return model.isLoading
        ? SizedBox(
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Loading...',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[CupertinoActivityIndicator()],
                )
              ],
            ),
          )
        : model.productList.isEmpty
            ? SizedBox(
                height: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2748/2748558.png',
                      height: 150.0,
                    ),
                  ],
                ),
              )
            : GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: model.productList
                    .map(
                      (product) => items(product, model, context),
                    )
                    .toList(),
              );
  }

  Widget items(Product product, HomeViewModel model, BuildContext context) {
    return InkWell(
      onTap: () => model.navigateToProdutView(context, product),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.1), offset: const Offset(3, 6))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                product.model!,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => model.makeFavorite(product),
                child: Icon(
                  product.isLiked! ? Icons.favorite : Icons.favorite_border,
                  color: product.isLiked! ? error : dark,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 90.0,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.modulate,
                imageUrl: product.image!,
                placeholder: (context, url) => Center(
                  child: SvgPicture.asset(
                    'images/svg/placeholder.svg',
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: SvgPicture.asset(
                    'images/svg/placeholder.svg',
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            product.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              height: 1,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
