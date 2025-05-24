import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> cat;

  const CategoryItem({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height / 6;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: <Widget>[
            Image.asset(
              cat["img"],
              height: size,
              width: size,
              fit: BoxFit.cover,
            ),
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.7],
                  colors: [
                    cat['color1'],
                    cat['color2'],
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size,
              width: size,
              child: Center(
                child: Text(
                  cat["name"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
