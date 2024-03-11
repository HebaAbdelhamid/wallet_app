import 'package:flutter/material.dart';

class Category {
  String name;
  String image;

  Category(this.name, this.image);
}

List<Category> categories = [];

List images = ['line-icon-for-category-vector.jpg', '2.png', '3.png', '1.jpg', '2.png', '3.png'];
List text = [
  'Food & Drinks ',
  'Shopping',
  'Tickets',
  'Food & Drinks',
  'Shopping',
  'Tickets'
];
Padding buildPaddingCategory(int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
    child: Container(
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Color(0xffDBE7C9), shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/${images[index]}'),
                  radius: 20,
                )),
          ),
          Center(
              child: Text(
            text[index],
            style: TextStyle(
              fontSize: 18,
            ),
            maxLines: 3,
          )),
        ],
      ),
    ),
  );
}
