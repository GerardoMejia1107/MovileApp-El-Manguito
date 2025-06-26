import 'package:flutter/material.dart';

class Relations extends StatelessWidget {
  const Relations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Amistades",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Text("Aquí irán las amistades"),
      ),
    );
  }
}
