import 'package:flutter/material.dart';
import '../widgets/food_delete_item.dart';
import '../util/foods.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    // Aplanar la lista de platos desde todas las categorías
    final List<Map<String, dynamic>> allFoods = categorizedFoods
        .expand((category) => (category["plates"] as List).cast<Map<String, dynamic>>())
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Lista de platillos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: allFoods.length,
          itemBuilder: (BuildContext context, int index) {
            final food = allFoods[index];
            return FoodDeleteItem(
              img: food["img"],
              name: food["title"],
            );
          },
        ),
      ),
    );
  }
}
