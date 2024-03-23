import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/colors/colors.dart';

List<LadaCar>Car_in_basket = [];

class Basket extends StatefulWidget {

  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
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
            itemCount: Car_in_basket.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(8),
                child: Stack(
                  children: [

                    ElevatedButton(onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => CardScreen(car: Car_in_basket[index],),
                        ),
                        );
                        },

                      child: ListTile(
                        leading:  ClipRRect(borderRadius: BorderRadius.circular(12),
                          child: Image.network(Car_in_basket[index].imageUrl.first.toString()),),
                        title: Text(Car_in_basket[index].name),
                        subtitle: Text(Car_in_basket[index].price),
                      ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),),


                            ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {

                            Car_in_basket.removeAt(index);

                          });
                        },

                      ),
                    )
                          ],
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

