import 'dart:io';
import 'package:el_mango/screens/relations.dart';
import 'package:el_mango/screens/sales.dart';
import 'package:el_mango/screens/valorations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selected = await picker.pickImage(source: ImageSource.gallery);

    if (selected != null) {
      setState(() {
        _imageFile = File(selected.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final double sales = 100.00;
    final double boxHeight = MediaQuery
        .of(context)
        .size
        .height / 14;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          '@username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Row(
        children: [
        Stack(
        alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:
              _imageFile != null
                  ? Image.file(
                _imageFile!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )
                  : Icon(
                Icons.account_box_rounded,
                size: 90,
                color: Color.fromARGB(100, 96, 96, 96),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 24,
                  color: Colors.black54,
                ),
                onPressed: _pickImage,
                tooltip: 'Cambiar foto',
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
            left: 70,
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
      const Divider(color: Colors.black, thickness: 0.8),
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: screenWidth,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(
                "Información relevante para el usuario",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(100, 73, 72, 72),
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: boxHeight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sales()),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Icon(
                          Icons.monetization_on,
                          size: 24,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Ventas',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(129, 15, 73, 216),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: boxHeight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Relations()),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Icon(
                          Icons.mobile_friendly,
                          size: 24,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Amigos',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(129, 15, 73, 216),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: boxHeight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Valorations()),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Icon(
                          Icons.star_border_purple500,
                          size: 24,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Valoraciones',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(129, 15, 73, 216),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Información de perfil"),
                        content: Padding(
                          padding: EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Información del usuario relevante")
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cerrar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SizedBox(
                height: boxHeight,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 10),
                      Icon(
                        Icons.accessibility,
                        size: 24,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Información de perfil',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(129, 15, 73, 216),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(height: 10),
          Text(
            "Cerrar sesión",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(215, 151, 23, 15),
            ),
          ),
          ],
        ),
      ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}
