import 'package:ecom_app/screens/products_by_category_screen.dart';
import 'package:flutter/material.dart';

class HomeProductCategory extends StatefulWidget {
  final int categoryId;
  final String categoryIcon;
  final String categoryName;

  HomeProductCategory(this.categoryIcon, this.categoryName, this.categoryId);
  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 190,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsByCategoryScreen(
                        categoryName: this.widget.categoryName,
                        categoryId: this.widget.categoryId,
                      )));
        },
        child: Card(
          child: Column(
            children: [
              Image.network(
                this.widget.categoryIcon,
                width: 190,
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(this.widget.categoryName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
