import 'package:flutter/material.dart';

class Category {
  String title;
  AssetImage image;
  Category({required this.title, required this.image});
}

List<Category> categories = [
  Category(
    title: "Food",
    image: const AssetImage("assets/images/food.jpeg"),
  ),
  Category(
    title: "Car",
    image: const AssetImage("assets/images/car.jpeg"),
  ),
  Category(
    title: "Groceries",
    image: const AssetImage("assets/images/groceries.jpeg"),
  ),
];
