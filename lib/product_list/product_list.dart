import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/car_info/lada_cars_grid.dart';
import 'package:untitled1/secondary screens/basket.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApplication.scaffoldColor,
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Basket(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(Car_in_basket.length.toString(), // количество элементов в корзине
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),



            ],
          ),
        ],
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('ProductList'),
        centerTitle: true,
      ),
      body: const LadaCarsGrid(),


    );

  }
}
