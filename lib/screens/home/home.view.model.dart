import 'package:bless/routes/index.dart';

class HomeViewModel extends BaseViewModel {
  final ProductController _productController = Get.put(ProductController());
  final ProductController _findProductController = Get.find();
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchControler = TextEditingController();
  late Timer searchOnStoppedTyping;
  late bool _isType = false;
  late bool _isLoading = false;
  late ProductsResult productsResult;
  late List<Product> _productList = [];
  final List<dynamic> _categoryList = [];
  late int _selectedCateforyId = -1;

  FocusNode get searchFocusNode => _searchFocusNode;
  TextEditingController get searchControler => _searchControler;
  bool get isType => _isType;
  bool get isLoading => _isLoading;
  List<Product> get productList => _productList;
  List<dynamic> get categoryList => _categoryList;
  int get selectedCateforyId => _selectedCateforyId;
  ProductController get productController => _productController;
  ProductController get findProductController => _findProductController;

  Future<void> initialise({required BuildContext context}) async {
    _searchControler.clear();
    _searchControler.addListener(_getLatestValue);
    getAllVideoList('');
  }

  navigateToProdutView(BuildContext context, Product product) {
    Navigator.pushNamed(context, ProductView.routeName, arguments: ProductViewArqument(product: product)).then((dynamic value) {
      if(value != null) {
       int index = _productList.indexWhere((element) => element.id == value['id']);
       if(index != -1) {
         _productList[index].isLiked = value['isLiked'];
         notifyListeners();
       }
      }
    });
  }

  _getLatestValue() {
    const duration = Duration(milliseconds: 500);
    searchOnStoppedTyping = Timer(duration, () => getAllVideoList(_searchControler.text.toLowerCase()));
  }

  // GET ALL PRODUCTS LIST
  getAllVideoList(String enteredKeyword, {bool isCategory = false, String categoryName = ''}) {
    if (_searchControler.text != '') {
      _isType = true;
    } else {
      _isType = false;
      _isLoading = true;
    }
    ProductService.getAllProducts().then((res) {
      _isLoading = false;
      productsResult = ProductsResult.fromJson(res);
      if (productsResult.status!) {
        _productList = productsResult.result!;
        if (_categoryList.isEmpty) {
          getAllCategories();
        }
        if (_isType) {
          _productList = _productList.where((product) => product.model!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
        }

        if (isCategory && categoryName != 'All') {
          _productList = _productList.where((product) => product.category!.toLowerCase().contains(categoryName.toLowerCase())).toList();
        }
      } else {
        _productList = [];
      }
      notifyListeners();
    });
  }

  void getAllCategories() {
    var seen = <String>{};
    List<Product> uniqueList = _productList.where((country) => seen.add(country.category!)).toList();
    _categoryList.add({'id': -1, 'name': 'All', 'image': 'https://cdn-icons-png.flaticon.com/512/282/282151.png', 'color': '0xFFA333FF'});
    for (var i = 0; i < uniqueList.length; i++) {
      var category = {
        'id': i,
        'name': uniqueList[i].category,
        'image': uniqueList[i].category == 'guitar'
            ? 'https://i.pinimg.com/originals/03/88/1e/03881ebbc2a10cd64aabe8b534c45a6e.png'
            : uniqueList[i].category == 'piano'
                ? 'https://images.vexels.com/media/users/3/148906/isolated/preview/d49e883ea93579b9f770baf731c6d87c-piano-musical-instrument-silhouette.png'
                : 'https://freesvg.org/img/Drums-Silhouette-2.png',
        'color': uniqueList[i].category == 'guitar'
            ? '0xFFFF5733'
            : uniqueList[i].category == 'piano'
                ? '0xFF33FF96'
                : '0xFFFFC300'
      };
      _categoryList.add(category);
    }
  }

  selectCategory(String categoryName, int id) {
    _selectedCateforyId = id;
    getAllVideoList(_searchControler.text.toLowerCase(), isCategory: true, categoryName: categoryName);
    notifyListeners();
  }

  void makeFavorite(Product product) {
    _productController.makeFavorite(product);
    notifyListeners();
  }
}
