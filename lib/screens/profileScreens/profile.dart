import 'dart:io';

import 'package:el_mango/util/foods.dart';
import 'package:el_mango/util/productsInfo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image');
    if (path != null && File(path).existsSync()) {
      setState(() {
        _image = File(path);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.png';

      // Borra la imagen anterior si existe
      final existingImage = File(imagePath);
      if (await existingImage.exists()) {
        await existingImage.delete();
      }

      // Copia la nueva imagen al path
      final savedImage = await File(pickedFile.path).copy(imagePath);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', savedImage.path);

      setState(() {
        _image = savedImage;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.95),
        titleSpacing: 16,
        title: Row(
          children: [
            Icon(Icons.person, color: theme.primaryColor),
            const SizedBox(width: 10),
            Text(
              "Mi perfil",
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              backgroundImage: _image != null
                                  ? FileImage(_image!, scale: DateTime.now().millisecondsSinceEpoch.toDouble())
                                  : null,
                            ),
                            const Icon(
                              Icons.camera_alt,
                              color: Colors.white70,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Usuario de Prueba',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'usuario@acoapaser.com',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(thickness: 1.5, indent: 16, endIndent: 16, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  const Text(
                    "Productos disponibles",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Categorías
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.category, size: 28, color: Colors.orange),
                          ),
                          const SizedBox(height: 8),
                          const Text("Categorías", style: TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text("${categorizedFoods.length}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),

                      // Platos
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.restaurant_menu, size: 28, color: Colors.green),
                          ),
                          const SizedBox(height: 8),
                          const Text("Platos", style: TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(
                              "${categorizedFoods.fold(0, (sum, cat) => sum + (cat['plates'] as List).length)}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),

                      // Productos
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.shopping_bag, size: 28, color: Colors.blue),
                          ),
                          const SizedBox(height: 8),
                          const Text("Productos", style: TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text("${productsInfo.length}",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    ],
    ),
    );
  }
}
