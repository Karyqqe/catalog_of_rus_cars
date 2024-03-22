import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';
import 'package:untitled1/product_list/card_product.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:untitled1/secondary screens/basket.dart';
import 'package:untitled1/secondary screens/favorite.dart';

class LadaCarsGrid extends StatefulWidget {
  const LadaCarsGrid({super.key});

  @override
  State<LadaCarsGrid> createState() => _LadaCarsGridState();
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
            childAspectRatio: 0.97,
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
                                 children: [
                                   ElevatedButton(onPressed: () {
                                     setState(() {
                                       ladaCars[index].inBasket = !ladaCars[index].inBasket;

                                       Car_in_basket.add(ladaCars[index]);


                                     });
                                   },
                                       child: Icon(
                                         ladaCars[index].inBasket ? Icons.shopping_basket : Icons.shopping_basket_outlined,
                                         color: ladaCars[index].inBasket ? Colors.deepPurple : Colors.grey,
                                       )),
                                   ElevatedButton(onPressed: () {
                                     setState(() {
                                       ladaCars[index].isLiked = !ladaCars[index].isLiked;

                                         Car_favorite.add(ladaCars[index]);


                                     });
                                   }, child: Icon(
                                     ladaCars[index].isLiked ? Icons.favorite : Icons.favorite_border,
                                     color: ladaCars[index].isLiked ? Colors.red : Colors.grey,
                                   ),



                                   ),
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
                icon: const Icon(Icons.home),
                onPressed: () {
                  // Действие при нажатии на кнопку "Home"
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favorite(),
                    ),
                  );
                },
              ),
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
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Действие при нажатии на кнопку "Profile"
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
