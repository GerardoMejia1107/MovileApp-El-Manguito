import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '@username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_box_rounded,
                  size: 90,
                  color: Color.fromARGB(100, 96, 96, 96),
                ),
                Column(
                  children: [
                    Text(
                      "Rol: Administrador",
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    Text(
                      "Cuenta No. 100200",
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 80,
                    top: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/logo acoapaser.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 0.8,
              endIndent: 0,
              indent: 0,
            ),
          ],
        ),
      ),
    );
  }
}
