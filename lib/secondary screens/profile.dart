import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-of-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1711065600&semt=ais'),
                  ),),


                Expanded(
                    flex: 1,
                    child: SizedBox()),

                Expanded(
                  flex: 6,
                  child:  Column(
                      children: [
                        Text('Стивен Бобс', style: TextStyle(fontSize: 24),),
                        Text('stiven11@gmail.com', style: TextStyle(fontSize: 20),)
                      ]


                  ),
                ),
              ],

            ),
          ),

          Padding(padding: EdgeInsets.all(30),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){Navigator.pushReplacementNamed(context, '/to_product_list');}, child: Text('TO PRODUCT LIST')),
                  ElevatedButton(onPressed: (){Navigator.pushReplacementNamed(context, '/to_shoplist');}, child: Text('TO SHOP LIST')),
                ],
              ),
            ),


        ],
      ),




      
    );




  }
}
