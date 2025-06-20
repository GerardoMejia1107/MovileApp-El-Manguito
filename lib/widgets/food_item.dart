import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final String img;
  final String flags;
  final String title;

  const FoodItem({Key? key, required this.img, required this.flags, required this.title})
    : super(key: key);

  @override
  _FoodItem createState() => _FoodItem();
}

class _FoodItem extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height / 2.5;
    //final double imageHeight = MediaQuery.of(context).size.height / 3.5;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: screenWidth,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: containerHeight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.asset(widget.img, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: screenWidth,
                  child: Text(
                    "Receta: ${widget.flags.split(',')[0]}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
