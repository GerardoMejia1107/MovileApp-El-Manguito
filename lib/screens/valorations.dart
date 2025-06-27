import 'package:el_mango/util/food_valoration.dart';
import 'package:el_mango/widgets/food_valoration_item.dart';
import 'package:flutter/material.dart';

class Valorations extends StatefulWidget {
  const Valorations({super.key});

  @override
  State<Valorations> createState() => _ValorationsState();
}

class _ValorationsState extends State<Valorations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Valoraciones",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  foods_valorations == null ? 0 : foods_valorations.length,
              itemBuilder: (BuildContext context, int index) {
                Map food_valoration = foods_valorations[index];
                return FoodValorationItem(
                  title: food_valoration["title"],
                  valorations: food_valoration["valorations"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
