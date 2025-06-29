import 'package:flutter/material.dart';
import '../widgets/food_edit_item.dart';
import '../util/foods.dart';

class EditFood extends StatefulWidget {
  const EditFood({super.key});

  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  @override
  Widget build(BuildContext context) {
    // Unificar todos los platillos de todas las categorías
    final List<Map<String, dynamic>> allFoods = categorizedFoods
        .expand((category) => (category["plates"] as List).cast<Map<String, dynamic>>())
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Editar platillos",
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
            return FoodEditItem(
              img: food["img"],
              name: food["title"],
            );
          },
        ),
      ),
    );
  }
}
