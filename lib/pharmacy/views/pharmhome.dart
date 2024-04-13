import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/controllers/pharmcontroller.dart';

class PharmHome extends StatelessWidget {
  const PharmHome({super.key});

  @override
  Widget build(BuildContext context) {
    final pharmcontroller = PharmController();
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _screenheight * 0.1,
        title: Text(
          "Inventory",
        ),
      ),
      body: Obx(() => Container(
          height: _screenheight * 0.8,
          child: pharmcontroller.bodies[pharmcontroller.selectedpage.value])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pharmcontroller.selectedpage.value,
        selectedItemColor: Color.fromARGB(255, 18, 205, 168),
        onTap: (index) {
          pharmcontroller.setindex(index);
          debugPrint("Index: $index");
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Orders",
          ),
        ],
      ),
    );
  }
}
