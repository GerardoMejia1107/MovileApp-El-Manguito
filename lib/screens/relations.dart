import 'package:el_mango/util/friendships.dart';
import 'package:el_mango/widgets/friend_item.dart';
import 'package:flutter/material.dart';

class Relations extends StatefulWidget {
  const Relations({super.key});

  @override
  State<Relations> createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amigos", style: TextStyle(fontSize: 24)),
        centerTitle: true,
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
              itemCount: friendships == null ? 0 : friendships.length,
              itemBuilder: (BuildContext context, int index) {
                Map friendship = friendships[index];

                return FriendItem(
                  img: friendship["img"],
                  name: friendship["name"],
                  relation: friendship["relation"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
