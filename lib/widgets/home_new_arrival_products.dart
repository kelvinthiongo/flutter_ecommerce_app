import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/widgets/home_hot_product.dart';
import 'package:flutter/material.dart';

class HomeNewArrivalProducts extends StatefulWidget {
  final List<Product> newArrivalProductList;

  HomeNewArrivalProducts({this.newArrivalProductList});
  @override
  _HomeNewArrivalProductsState createState() => _HomeNewArrivalProductsState();
}

class _HomeNewArrivalProductsState extends State<HomeNewArrivalProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.newArrivalProductList.length,
        itemBuilder: (context, index) {
          return HomeHotProduct(this.widget.newArrivalProductList[index]);
        },
      ),
    );
  }
}
