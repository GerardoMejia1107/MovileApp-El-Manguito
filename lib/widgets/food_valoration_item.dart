import 'package:flutter/material.dart';

class FoodValorationItem extends StatefulWidget {
  final String title;
  final String valorations;

  const FoodValorationItem({
    Key? key,
    required this.title,
    required this.valorations,
  }) : super(key: key);

  @override
  State<FoodValorationItem> createState() => _FoodValorationItemState();
}

class _FoodValorationItemState extends State<FoodValorationItem> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        widget.valorations,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Platillo: ${widget.title}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Tienes una nueva valoración!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 158, 55),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
