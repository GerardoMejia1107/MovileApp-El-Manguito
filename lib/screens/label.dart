import '../util/foods.dart';
import '../widgets/food_item.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({Key? key})
    : super(key: key); // Nota el signo ? en Key? para hacerlo nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Etiquetas",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foods == null ? 0 : foods.length,
              itemBuilder: (BuildContext context, int index) {
                Map food = foods[index];

                return FoodItem(img: food["img"], flags: food["flags"], title: food["title"]);
              },
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
