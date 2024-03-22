import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/colors/colors.dart';

List<LadaCar>Car_favorite = [];

class Favorite extends StatelessWidget {

  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApplication.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorsApplication.appBarColor,
        title: const Text('Shopping cart'),
        centerTitle: true,),
      body: Column(
        children: <Widget> [
          Expanded(child:  ListView.builder(
            itemCount: Car_favorite.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(8),
                child:  ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardScreen(car: Car_favorite[index],),
                    ),
                  );
                },
                  child: ListTile(
                    leading: Image.network(Car_favorite[index].imageUrl.toString()),
                    title: Text(Car_favorite[index].name),
                    subtitle: Text(Car_favorite[index].price),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),





                  ),
                ),
              );


            },


          ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: EdgeInsets.all(8),
              child: ElevatedButton(onPressed: () {},
                child: Text('ORDER',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),),
              ),
            ),

          )
        ],
      ),

    );
  }
}