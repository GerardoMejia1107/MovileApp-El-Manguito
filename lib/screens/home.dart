import 'dart:io';

import 'package:flutter/material.dart';
import '../screens/categories.dart';
import '../screens/trending.dart';
import '../util/categories.dart';
import '../util/friends.dart';
import '../util/restaurants.dart';
import '../widgets/category_item.dart';
import '../widgets/search_card.dart';
import '../widgets/slide_item.dart';

class Home extends StatelessWidget {
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
              buildSearchBar(context),
              SizedBox(height: 20.0),
              buildRestaurantRow('Nuestra comida', context),
              SizedBox(height: 10.0),
              buildRestaurantList(context),
              SizedBox(height: 10.0),
              buildCategoryRow('Nuestra variedad de productos', context),
              SizedBox(height: 10.0),
              buildCategoryList(context),
              SizedBox(height: 20.0),
              buildCategoryRow('Compartelo con tus amigos', context),
              SizedBox(height: 10.0),
              buildFriendsList(),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          restaurant,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Trending()),
            );
          },
          child: Text(
            "Menu",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          category,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories()),
            );
          },
          child: Text(
            "Platillos",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: SearchCard(),
    );
  }

  Widget buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> cat = Map<String, dynamic>.from(categories[index]);

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  Widget buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"],
            ),
          );
        },
      ),
    );
  }

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
