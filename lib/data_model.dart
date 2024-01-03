import 'dart:convert';

class ImageModel {
  String? a;
  String? b;
  String? c;
  String? d;
  String? e;

  ImageModel(
      { this.a, required this.b, required this.c, required this.d, required this.e});

  factory ImageModel.fromJson(Map<String, dynamic> json){
    return ImageModel(a: json['a'],
        b: json['b'],
        c: json['c'],
        d: json['d'],
        e: json['e']);
  }
}

class ProductModel {
  ///for
  ///print(mData[products][1]["id])
  ///print(productModel())
  ///
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<ImageModel>? images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    List<ImageModel> listImages =[];
    for(Map<String, dynamic> eachMap in json['images']){
      var eachImage = ImageModel.fromJson(eachMap );
      listImages.add(eachImage);
    }

    return ProductModel(id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        images: listImages);
  }
}

class ProductDataModel {
  int? total;
  int? skip;
  int? limit;
  List<ProductModel>? products;

  ProductDataModel({required this.products,
    required this.total,
    required this.limit,
    required this.skip,});

  factory ProductDataModel.fromJson(Map<String, dynamic> json){
    List<ProductModel> listProducts =[];
    for(Map<String, dynamic> eachMap in json['products']){
    var eachProduct = ProductModel.fromJson(eachMap);
    listProducts.add(eachProduct);
    }

    return ProductDataModel(products: listProducts, total: json['total'], limit: json['limit'], skip: json['skip']);
  }
}