part of homeview;

class _HomeSearchView extends ViewModelWidget<HomeViewModel> {
  const _HomeSearchView({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Column(children: <Widget>[
      const SizedBox(
        height: 20.0,
      ),
      Container(
        height: 45,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(blurRadius: 10, color: dark.withOpacity(0.1), offset: const Offset(3, 6))],
        ),
        child: TextField(
          onTap: () {},
          focusNode: model.searchFocusNode,
          controller: model.searchControler,
          readOnly: false,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () => model.searchControler.clear(),
                  child: Icon(
                    model.isType ? Icons.close : Icons.search,
                    size: 25,
                    color: Colors.grey.withOpacity(0.3),
                  )),
              hintText: 'Search Your Model',
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.withOpacity(0.3)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(8),
              fillColor: light.withOpacity(0.1)),
        ),
      )
    ]);
  }
}
