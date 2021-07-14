import 'dart:convert';

import 'package:ecom_app/helpers/customFunctions.dart';
import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/services/product_service.dart';
import 'package:ecom_app/widgets/product_by_category.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  ProductsByCategoryScreen({this.categoryName, this.categoryId});

  @override
  _ProductsByCategoryScreenState createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  List<Product> _productListByCategory = List<Product>();

  ProductService _productService = ProductService();

  _getProductsByCategory(int categoryId) async {
    var products = await _productService.getProductsByCategory(categoryId);
    var _list = json.decode(products.body);
    _list['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'];
      model.detail = data['detail'];
      model.discount = data['discount'];

      setState(() {
        _productListByCategory.add(model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getProductsByCategory(this.widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(this.widget.categoryName),
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _productListByCategory.length,
            itemBuilder: (context, index) {
              return ProductByCategory(this._productListByCategory[index]);
            }),
      ),
    );
  }
}
