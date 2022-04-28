part of homeview;

class _HomeBody extends ViewModelWidget<HomeViewModel> {
  const _HomeBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'images/logo/bless-logo-2.png',
                height: 50,
              ),
              const CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage("https://www.rraa.org.af/wp-content/uploads/2019/06/man.png"),
                backgroundColor: Colors.transparent,
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: const <Widget>[
              Text(
                'Hello',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                'Tharusan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const _HomeSearchView(),
          const SizedBox(
            height: 5.0,
          ),
          Flexible(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                model.categoryList.isNotEmpty ? const _MainCategoriesView() : const SizedBox(),
                const _HomeProductList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
