import 'package:el_mango/widgets/food_delete_item.dart';
import 'package:flutter/material.dart';

import '../util/foods.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Lista de platillos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            Map food = foods[index];
            return FoodDeleteItem(img: food["img"], name: food["title"]);
          },
        ),
      ),
    );
  }
}
