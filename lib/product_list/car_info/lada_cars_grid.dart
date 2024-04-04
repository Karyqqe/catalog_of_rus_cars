import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:untitled1/secondary screens/basket.dart';
import 'package:untitled1/secondary screens/favorite.dart';
import 'package:untitled1/secondary%20screens/shopping%20list.dart';
import 'package:untitled1/secondary screens/profile.dart';

class LadaCarsGrid extends StatefulWidget {
  const LadaCarsGrid({super.key});

  @override
  State<LadaCarsGrid> createState() => _LadaCarsGridState();
}
Widget buildCarCount(List<LadaCar> carss) {
  if (carss.length != 0) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          carss.length.toString(), // количество элементов в корзине
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  } else {
    return SizedBox(); // Возвращаем пустой виджет, если Car_favorite пуст
  }
}


class _LadaCarsGridState extends State<LadaCarsGrid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:
      true, // Расширяем область body за пределы аппбара и bottomNavigationBar

      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.87,
          ),
          itemCount: ladaCars.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardScreen(car: ladaCars[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: ColorsApplication.container),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                          ladaCars[index].imageUrl.isNotEmpty
                              ? ladaCars[index].imageUrl[0]
                              : '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        ),
                      ),
                    ),
                    Text(ladaCars[index].name),
                    Text(
                      'Цена: ${ladaCars[index].price}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [








                             Padding(padding: EdgeInsets.only(left: 2, right: 2),
                              child:
                              ElevatedButton(onPressed: () {
                                setState(() {
                                  ladaCars[index].inBasket = !ladaCars[index].inBasket;

                                  Car_in_basket.add(ladaCars[index]);


                                });
                              },
                                  child: Icon(
                                    ladaCars[index].inBasket ? Icons.shopping_basket : Icons.shopping_basket_outlined,
                                    color: ladaCars[index].inBasket ? Colors.deepPurple : Colors.grey,
                                  )),),




                               Padding(padding: EdgeInsets.only(left: 2, right: 2),
                                  child:

                                  ElevatedButton(onPressed: () {
                                    setState(() {
                                      ladaCars[index].isLiked = !ladaCars[index].isLiked;

                                      Car_favorite.add(ladaCars[index]);


                                    });
                                  }, child: Icon(
                                    ladaCars[index].isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: ladaCars[index].isLiked ? Colors.red : Colors.grey,
                                  ),



                                  ),),



                          ],
                        )

                    ),






                  ],
                ),
              ),

            );
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomAppBar(
          color: Colors.grey, // Цвет фона серый
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopList(),
                    ),
                  );
                },
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Favorite(),
                        ),
                      );
                    },
                  ),
                  buildCarCount(Car_favorite),

                ],
              ),
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
                 buildCarCount(Car_in_basket),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/to_profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}