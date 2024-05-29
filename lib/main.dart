import 'package:flutter/material.dart';
import 'package:may29/views/categories_screens/categories_screen.dart';
import 'package:may29/views/products_screen/home_page.dart';
import 'package:may29/views/user_screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: [
          ProductsScreen(),
          CategoryScreen(),
          UserScreen(),
        ],
      ),
    );
  }
}
