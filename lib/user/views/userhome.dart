import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/controllers/pharmcontroller.dart';
import 'package:pharmalinkfend/user/controllers/usercontroller.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    UserController us = Get.put(UserController());
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Obx(() => Container(
          height: _screenheight * 0.8,
          child: us.bodies[us.selectedpage.value])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 18, 205, 168),
          unselectedItemColor: Color.fromARGB(177, 75, 75, 75),
          currentIndex: us.selectedpage.value,
          onTap: (index) {
            us.setindex(index);
            debugPrint("Index: ");
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Community",
            ),
          ],
        ),
      ),
    );
  }
}
