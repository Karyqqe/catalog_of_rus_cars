import 'package:flutter/material.dart';

import 'package:untitled1/product_list/product_list.dart';
import 'package:untitled1/reg_autorization/reg_autorization.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/':(context) => const LoginSignUpScreen(),
        '/to_product_list':(context) => const ProductList(),

      },
    );
  }
}

