import 'package:flutter/material.dart';
import 'view/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(NewsCloud());
}

class NewsCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
