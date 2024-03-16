import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/product_list/car_info/lada_car_info.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


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
            height: 300, // Вы можете установить желаемую высоту изображения
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
            flex: 2,
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
              initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=5pvinfRkODU&ab_channel=%D0%A8%D0%B0%D1%85%D0%BC%D0%B0%D1%82%D1%8B-%D1%8D%D1%82%D0%BE%D0%9A%D1%80%D1%83%D1%82%D0%BE').toString(),
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
