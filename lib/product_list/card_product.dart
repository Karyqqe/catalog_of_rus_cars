

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:untitled1/secondary screens/basket.dart';
import 'package:untitled1/secondary screens/favorite.dart';
import 'package:untitled1/secondary screens/shopping list.dart';


class CardScreen extends StatefulWidget {
  final LadaCar car;


  const CardScreen({super.key, required this.car});

  @override
  // ignore: library_private_types_in_public_api
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int currentPage = 1;
  late YoutubePlayerController _controller;


  @override
  void initState(){
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.car.youtubeVideo).toString(),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.name),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(

            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.car.imageUrl.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page + 1;
                    });
                  },
                  itemBuilder: (context, idx) {
                    return Image.network(
                      widget.car.imageUrl[idx],
                      fit: BoxFit
                          .fitWidth, // Растягиваем изображение на всю ширину
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '$currentPage/${widget.car.imageUrl.length}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),

          Expanded(
            flex: 3,
            child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.car.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Price: ${widget.car.price}'),




                Row(

                  children: [

                    Expanded(
                      flex: 2,
                      child:
                      Padding(padding: EdgeInsets.only(left: 2, right: 2),

                        child:
                        ElevatedButton(onPressed: () {
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return Padding(padding: const EdgeInsets.all(16),
                              child: Container(
                                child: Scaffold(
                                  body: Column(
                                    children: [
                                      Text("BUYING", style: TextStyle(fontSize: 34),),
                                      ElevatedButton(onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardScreen(car: widget.car),
                                          ),
                                        );

                                      }, child:
                                      ListTile(
                                        leading:  ClipRRect(borderRadius: BorderRadius.circular(12),
                                          child: Image.network(widget.car.imageUrl.first.toString()),),
                                        title: Text(widget.car.name),
                                        subtitle: Text(widget.car.price),
                                      ),),


                                      Padding(padding: EdgeInsets.only(top: 16),

                                          child:
                                          ElevatedButton(onPressed: () {Car_in_shopping_list.add(widget.car);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ShopList(),
                                            ),
                                          );
                                            }, child: Text("TO PAY"),

                                            style: ButtonStyle(

                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange)),)
                                      ),

                                    ],
                                  ),
                                ),),

                            );
                          },);
                        },
                            child: Text("BUY NOW")),),),

                    ElevatedButton(onPressed: () {
                      setState(() {
                        widget.car.inBasket = !widget.car.inBasket;

                        Car_in_basket.add(widget.car);


                      });
                    },
                        child: Icon(
                          widget.car.inBasket ? Icons.shopping_basket : Icons.shopping_basket_outlined,
                          color: widget.car.inBasket ? Colors.deepPurple : Colors.grey,
                        )),

                    ElevatedButton(onPressed: () {
                      setState(() {
                        widget.car.isLiked = !widget.car.isLiked;

                        Car_favorite.add(widget.car);


                      });
                    }, child: Icon(
                      widget.car.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: widget.car.isLiked ? Colors.red : Colors.grey,
                    ),



                    ),


                  ],
                )

              ],
            ),
          ),
          ),
         Expanded(
           flex: 2,
           child:  Align(
           alignment: Alignment.centerLeft,


           child: Container(
             width: MediaQuery.of(context).size.width / 2,
             margin: EdgeInsets.all(8),
             child: ListView(
               shrinkWrap: true,
               children: [
                 Text(widget.car.description)
               ],
             ),
           ),
         ),),

      Expanded(
        flex: 4,
        child:  Align(
        alignment: Alignment.centerLeft,

        child: Container(

          width: MediaQuery.of(context).size.width ,
          margin: EdgeInsets.all(8),

          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(widget.car.youtubeVideo).toString(),
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
          ),
        ),
      ),)



        ],
      ),
    );
  }
}
