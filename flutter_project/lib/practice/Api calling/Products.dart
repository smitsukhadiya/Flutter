import 'dart:convert';

/// id : 1
/// title : "iPhone 9"
/// description : "An apple mobile which is nothing like apple"
/// price : 549
/// discountPercentage : 12.96
/// rating : 4.69
/// stock : 94
/// brand : "Apple"
/// category : "smartphones"
/// thumbnail : "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
/// images : ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"]

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.stock, 
      this.brand, 
      this.category, 
      this.thumbnail, 
      this.images,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
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
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['brand'] = brand;
    map['category'] = category;
    map['thumbnail'] = thumbnail;
    map['images'] = images;
    return map;
  }

}