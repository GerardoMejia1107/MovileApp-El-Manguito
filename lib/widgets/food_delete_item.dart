import 'package:flutter/material.dart';

class FoodDeleteItem extends StatefulWidget {
  final String img;
  final String name;

  const FoodDeleteItem({Key? key, required this.img, required this.name})
    : super(key: key);

  @override
  State<FoodDeleteItem> createState() => _FoodDeleteItemState();
}

class _FoodDeleteItemState extends State<FoodDeleteItem> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth / 4,
      height: screenHeight / 6,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.img,
                    width: screenWidth / 4.2,
                    height: screenHeight / 6.2,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: const Text("¿Eliminar producto?"),
                            content: Text(
                              "¿Estás seguro que deseas eliminar \"${widget.name}\"?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Aquí deberías usar setState para eliminarlo
                                  // o llamar a un callback para eliminar en el padre
                                  Navigator.of(
                                    context,
                                  ).pop(); // Cierra el dialog
                                },
                                child: const Text(
                                  "Eliminar",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
