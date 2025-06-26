import '../util/foods.dart';
import '../widgets/food_item.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Notificaciones",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          final food = foods[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(
                      (food["title"]?.trim().isNotEmpty ?? false)
                          ? food["title"].toUpperCase()
                          : "Producto",
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(food["img"], fit: BoxFit.cover),
                        const SizedBox(height: 10),
                        Text("Etiquetas: ${food["flags"]}"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cerrar"),
                      ),
                    ],
                  );
                },
              );
            },
            child: FoodItem(
              img: food["img"],
              flags: food["flags"],
              title: food["title"],
            ),
          );
        },
      ),
    );
  }
}
