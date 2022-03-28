import 'package:flutter/material.dart';
import 'package:plant_shop/screen/shop_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopPage(),
    );
  }
}