import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({Key? key}) : super(key: key);  // Nota el signo ? en Key? para hacerlo nullable

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Label'),
      ),
    );
  }
}
