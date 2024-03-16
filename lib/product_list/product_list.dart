import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/car_info/lada_cars_grid.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApplication.scaffoldColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.shopping_cart),)
        ],
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('ProductList'),
        centerTitle: true,
      ),
      body: const LadaCarsGrid(),


    );

  }
}
