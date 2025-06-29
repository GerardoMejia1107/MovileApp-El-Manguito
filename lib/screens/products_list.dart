import 'package:el_mango/util/productsInfo.dart';
import 'package:el_mango/widgets/product_delete_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Lista de productos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productsInfo.length,
          itemBuilder: (BuildContext context, int index) {
            Map category = productsInfo[index];
            return ProductDeleteItem(img: category["img"], name: category["name"]);
          },
        ),
      ),
    );
  }
}
