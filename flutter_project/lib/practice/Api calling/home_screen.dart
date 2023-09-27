import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/Api%20calling/Product.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> itemList = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ProductList productList = ProductList.fromJson(data);
      List<Product> products = productList.products;

      // Now you have a list of Product objects to work with
      for (Product product in products) {
        setState(() {
          itemList.add(product);
        });
      }
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future<void> fetchProducts() async {
  //   final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     Product product = Product.fromJson(data);
  //     List<Products>? products = product.products;
  //
  //     // Now you have a list of Product objects to work with
  //     for (var product in data) {
  //        itemList.add(Products.fromJson(product));
  //     }
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        title:
            const Text('ShoppiO App', style: TextStyle(color: Colors.white54)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        itemList[index].thumbnail,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(itemList[index].title,
                                   // maxLines: 1,
                                    style: const TextStyle(
                                     // overflow: TextOverflow.ellipsis,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:  Text('${itemList[index].rating} ⭐',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                           Text('(${itemList[index].category})',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          const SizedBox(height: 7),
                           Text('\$${itemList[index].price} |${itemList[index].discountPercentage}% Off',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 5),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Expanded(
                                 child: Text('Brand : ${itemList[index].brand}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                               ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:  Text('Remain Stock ${itemList[index].stock}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                          const SizedBox(height: 7),
                          const Text('Description :',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                           Text(
                              itemList[index].description,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}

// Stack(
// fit: StackFit.expand,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(15),
// child: Image.asset('assets/Grid/images (7).jpeg',fit: BoxFit.cover)),
// ],
// ),
