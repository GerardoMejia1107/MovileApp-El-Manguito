import 'dart:io';

import 'package:el_mango/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../util/productsInfo.dart';
import '../util/friends.dart';
import '../widgets/category_item.dart';
import '../widgets/homeWidgets/food_slide_item.dart';
import '../util/foods.dart';
import '../screens/platesScreens/food_detail.dart';
import '../screens/productsScreens/product_detail.dart';



class Home extends StatelessWidget {
  final Function(int) onNavigateToPage;
  const Home({required this.onNavigateToPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              buildHeroSection(context),
              SizedBox(height: 20.0),
              buildRestaurantRow('Nuestra comida', context),
              SizedBox(height: 10.0),
              buildRestaurantList(context),
              SizedBox(height: 20.0),
              buildCategoryRow('Nuestros productos', context),
              SizedBox(height: 10.0),
              buildProductIconsList(context),
              //SizedBox(height: 20.0),
              //buildFriendsRow('Compartelo con tus amigos', context),
              //SizedBox(height: 10.0),
              //buildFriendsList(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
  //seccion de imagen Hero
  Widget buildHeroSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            'assets/hero.jpg',
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Capa de oscurecimiento
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            color: Colors.black.withOpacity(0.35),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido a El Manguito',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Descubre sabores únicos y productos locales.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //CTA de platos destacados
  Widget buildRestaurantRow(String restaurant, BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Text(
                restaurant,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                onNavigateToPage(1); // Por ejemplo, ir a ProductList (índice 3)
              },
              child: Text(
                "Ver menu",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //lista de platos destacados
  Widget buildRestaurantList(BuildContext context) {
    final List<Map<String, dynamic>> allFoods = categorizedFoods
        .expand((category) {
      final catName = category["category"];
      final plates = category["plates"] as List<Map<String, dynamic>>;
      return plates.map((plate) => {
        ...plate,
        "category": catName,
      });
    })
        .toList();

    final List<Map<String, dynamic>> firstFive = allFoods.take(5).toList();

    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: firstFive.length,
        itemBuilder: (BuildContext context, int index) {
          final food = firstFive[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FoodDetail(food: food),
                ),
              );
            },
            child: Hero(
              tag: food['img'],
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: FoodSlideItem(
                  img: food['img'],
                  title: food['title'],
                  address: 'Disponible en restaurante',
                  category: food['category'] ?? '',
                  rating: (food['rating'] ?? 0).toDouble(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //CTA de productos destacados
  Widget buildCategoryRow(String category, BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                onNavigateToPage(3); // Por ejemplo, ir a ProductList (índice 3)
              },
              child: Text(
                "Ver más",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //lista de productos destacados
  Widget buildProductIconsList(BuildContext context) {
    final topProducts = productsInfo.take(5).toList();

    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topProducts.length,
        itemBuilder: (context, index) {
          final product = topProducts[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        product['img'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['name'],
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //CTA de ompartelo con tus amigos
  Widget buildFriendsRow(String category, BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }

  //lista de amigos
  Widget buildFriendsList() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends == null ? 0 : friends.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 25.0,
            ),
          );
        },
      ),
    );
  }



}
