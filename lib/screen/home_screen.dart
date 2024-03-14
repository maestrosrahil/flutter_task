import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_task/components/custom_text_widget.dart.dart';
import 'package:flutter_task/screen/add_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/neumorphism_widget.dart';
import '../helper/constants.dart';
import '../helper/size_config.dart';
import '../model/product.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadProducts();
  }

  void _loadProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsJson = prefs.getString('products');
    if (productsJson != null) {
      List<dynamic> productsList = json.decode(productsJson);
      setState(() {
        _products = productsList.map((item) => Product.fromMap(item)).toList();
      });
    } else {
      setState(() {
        _products = [];
      });
    }
  }

  void _saveProducts(List<Product> products) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsJsonList =
        products.map((product) => product.toJson()).toList();
    prefs.setStringList('products', productsJsonList);
  }

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
      _saveProducts(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          Product? newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          );
          if (newProduct != null) {
            _addProduct(newProduct);
          }
        },
        child: Container(
            margin: EdgeInsets.only(right: 15, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue),
            child: Icon(Icons.add, color: Colors.white)),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
            margin: EdgeInsets.only(left: 15, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade50),
            child:
                Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black38)),
        actions: [
          Container(
              margin: EdgeInsets.only(left: 15, top: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Colors.grey.shade50),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.search, color: Colors.black38),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextWidget(
              text: 'HI-FI Shop & Service',
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: 'Audio shop Rustaveli Ave 57',
              textColor: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: 'This shop offers both products and services',
              textColor: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            SizedBox(height: 20),
            CustomTextWidget(
              text: 'Product 1',
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: AlignedGridView.count(
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_products.isEmpty) {
                    return const Center(
                      child: CustomTextWidget(
                          text: 'No Product found', textColor: Colors.red),
                    );
                  }
                  return NeumorphismWidget(
                    padding: EdgeInsets.zero,
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          Center(
                            child: Container(
                              height: 120,
                              width: 150,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: _products[index].imageUrl,
                                  ),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: const Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: CustomTextWidget(
                              text: _products[index].name,
                              maxLine: 1,
                              textColor: Colors.black,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: CustomTextWidget(
                              text:
                                  '\$${_products[index].price.toStringAsFixed(2)}',
                              maxLine: 1,
                              textColor: Colors.black38,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
