import 'dart:io';
import 'package:el_mango/screens/edit_food.dart';
import 'package:el_mango/screens/edit_product.dart';
import 'package:el_mango/screens/food_list.dart';
import 'package:el_mango/screens/products_list.dart';
import 'package:el_mango/widgets/food_delete_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../util/foods.dart';
import 'sales.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Opciones",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Añadir",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap:
                      () => showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Nuevo producto"),
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Nombre del producto',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese un nombre para el producto';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Text("Inserte una imagen acorde al producto"),
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
                                                  Icons.photo,
                                                  size: 125,
                                                  color: Color.fromARGB(
                                                    100,
                                                    96,
                                                    96,
                                                    96,
                                                  ),
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Descripción del producto',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese una descripción del producto';
                                      }
                                      return null;
                                    },
                                  ),
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
                      ),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.style_outlined,
                                color: Color.fromARGB(100, 66, 66, 66),
                                size: 90,
                              ),
                              SizedBox(height: 5),
                              Text("Producto"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Nuevo platillo"),
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Nombre del platillo',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese un nombre para el platillo';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Text("Inserte una imagen acorde al platillo"),
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
                                                  Icons.photo,
                                                  size: 125,
                                                  color: Color.fromARGB(
                                                    100,
                                                    96,
                                                    96,
                                                    96,
                                                  ),
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Etiquetas del platillo',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese etiquetas del platillo';
                                      }
                                      return null;
                                    },
                                  ),
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
                      ),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.fastfood_rounded,
                                color: Color.fromARGB(255, 253, 236, 93),
                                size: 90,
                              ),
                              SizedBox(height: 5),
                              Text("Platillo"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Quitar",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductsList()),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.style_outlined,
                                  color: Color.fromARGB(100, 66, 66, 66),
                                  size: 90,
                                ),
                                SizedBox(height: 5),
                                Text("Producto"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodList()),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.fastfood_rounded,
                                  color: Color.fromARGB(255, 253, 236, 93),
                                  size: 90,
                                ),
                                SizedBox(height: 5),
                                Text("Platillo"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Editar",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProduct()),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.style_outlined,
                                  color: Color.fromARGB(100, 66, 66, 66),
                                  size: 90,
                                ),
                                SizedBox(height: 5),
                                Text("Producto"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditFood()),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.fastfood_rounded,
                                  color: Color.fromARGB(255, 253, 236, 93),
                                  size: 90,
                                ),
                                SizedBox(height: 5),
                                Text("Platillo"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
