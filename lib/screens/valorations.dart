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
        child: Text("Aquí irán las valoraciones"),
      ),
    );
  }
}
