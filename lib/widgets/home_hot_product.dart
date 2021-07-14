import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/product_detail.dart';
import 'package:flutter/material.dart';

class HomeHotProduct extends StatefulWidget {
  final Product product;

  HomeHotProduct(this.product);
  @override
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 260,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(this.widget.product)));
        },
        child: Card(
          child: Column(
            children: [
              Text(this.widget.product.name),
              Image.network(
                this.widget.product.photo,
                width: 190,
                height: 160,
              ),
              Row(
                children: <Widget>[
                  Text("Price: ${this.widget.product.price}"),
                  Text("Discount: ${this.widget.product.discount}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
