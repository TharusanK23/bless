class ProductsResult {
  ProductsResult({
    this.result,
    this.status,
  });

  List<Product>? result;
  bool? status;

  factory ProductsResult.fromJson(Map<String, dynamic> json) => ProductsResult(
        result: json["result"] != null ? List<Product>.from(json["result"].map((x) => Product.fromJson(x))) : [],
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "status": status,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.category,
    this.brand,
    this.model,
    this.price,
    this.colour,
    this.weight,
    this.image,
    this.isLiked,
    this.qty
  });

  String? id;
  String? name;
  String? category;
  String? brand;
  String? model;
  double? price;
  String? colour;
  String? weight;
  String? image;
  bool? isLiked;
  int? qty;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        brand: json["brand"] ?? '',
        model: json["model"] ?? '',
        price: json["price"] ?? 0.0,
        colour: json["colour"] ?? '',
        weight: json["weight"] ?? '',
        image: json["image"] ?? '',
        isLiked: json["isLiked"] ?? false,
        qty: json["qty"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "brand": brand,
        "model": model,
        "price": price,
        "colour": colour,
        "weight": weight,
        "image": image,
        "isLiked": isLiked,
        "qty": qty
      };
}
