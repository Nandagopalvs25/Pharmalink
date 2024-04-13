import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PharmHome extends StatelessWidget {
  const PharmHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _screenheight * 0.1,
        title: Text(
          "Inventory",
        ),
      ),
      body: Container(
        height: _screenheight * 0.8,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Inventory"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Orders"),
        ],
      ),
    );
  }
}
