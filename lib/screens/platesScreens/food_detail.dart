import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final Map<String, dynamic> food;

  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(food["title"] ?? "Detalle"),
        backgroundColor: theme.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: food["img"],
            child: Image.asset(
              food["img"],
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food["title"] ?? "Producto",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Etiquetas: ${food["flags"]}",
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  "Precio: \$${food["price"]?.toStringAsFixed(2) ?? '0.00'}",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
