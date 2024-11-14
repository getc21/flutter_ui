import 'package:flutter/material.dart';

class Menu {
  String title;
  IconData icon;
  String image;
  List<String> items;
  BuildContext context;
  Color menuColor;

  Menu(
      {required this.title,
      required this.icon,
      required this.image,
      required this.items,
      required this.context,
      this.menuColor = Colors.black});
}
