import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:flutter/widgets.dart';

List<LadaCar>Car_in_basket = [];

class Basket extends StatelessWidget {
  final LadaCar car;
  const Basket({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Car_in_basket.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(car.imageUrl[index]),
          );
    },
      ),
    );
  }
}

