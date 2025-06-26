import 'package:flutter/material.dart';

class FriendItem extends StatefulWidget {
  final String img;
  final String name;
  final String relation;

  const FriendItem({
    Key? key,
    required this.img,
    required this.name,
    required this.relation,
  }) : super(key: key);

  @override
  State<FriendItem> createState() => _FriendItemState();
}

class _FriendItemState extends State<FriendItem> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 100,
      width: screenWidth,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.img, height: 80, width: 50)),
              SizedBox(height: 5),
              Text(
                "Nombre: ${widget.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                "Friendship state: ${widget.relation}",
                style: TextStyle(fontSize:16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
