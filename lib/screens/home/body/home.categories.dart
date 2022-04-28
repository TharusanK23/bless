part of homeview;

class _MainCategoriesView extends ViewModelWidget<HomeViewModel> {
  const _MainCategoriesView({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Column(children: <Widget>[
      const SizedBox(
        height: 20.0,
      ),
      Row(
        children: const <Widget>[
          Text(
            'By Category',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),
      SizedBox(
        height: 75.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: model.categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => model.selectCategory(model.categoryList[index]['name'], model.categoryList[index]['id'] ),
              highlightColor: transparent,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                margin: EdgeInsets.only(left: index == 0 ? 0 : 5, right: index == (model.categoryList.length - 1) ? 0 : 5, top: 0, bottom: 0),
                width: 120.0,
                decoration: BoxDecoration(
                  color: Color(int.parse(model.categoryList[index]['color'])).withOpacity( model.selectedCateforyId == model.categoryList[index]['id'] ? 0.5 : 1),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [BoxShadow(blurRadius: 5, color: dark.withOpacity(0.2), offset: const Offset(2, 4))],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Image.network(
                    model.categoryList[index]['image'],
                    width: 40.0,
                    height: 40.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    model.categoryList[index]['name'].toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  )
                ]),
              ),
            );
          },
        ),
      )
    ]);
  }
}
