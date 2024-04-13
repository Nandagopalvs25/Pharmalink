import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/user/views/usersearch.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              "Hello!",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 205, 168),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: _screenheight * 0.005,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const UserSearch());
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 238, 255, 253),
                    suffixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 0.1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 0.5)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    hintText: "Search you required medicine",
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _screenwidth * 0.3,
                  height: _screenheight * 0.05,
                  child: Center(
                    child: Text(
                      "Cosmetic",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: _screenheight * 0.016),
                    ),
                  ),
                  margin:
                      EdgeInsets.only(top: 10, left: 20, bottom: 20, right: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 198, 171),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //border: Border.all(width: 0.5, color: Colors.black)),
                ),
                Container(
                  width: _screenwidth * 0.3,
                  height: _screenheight * 0.05,
                  child: Center(
                    child: Text(
                      "Painkillers",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: _screenheight * 0.016),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 198, 171),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //border: Border.all(width: 0.5, color: Colors.black)),
                ),
                Container(
                  width: _screenwidth * 0.3,
                  height: _screenheight * 0.05,
                  child: Center(
                    child: Text(
                      "Vitamins",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: _screenheight * 0.016),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 198, 171),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //border: Border.all(width: 0.5, color: Colors.black)),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: _screenheight * 0.015),
              height: _screenheight * 0.09,
              child: Center(
                child: Text(
                  "25% off on Cosmetics.\nUse code : GDSC24",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: _screenheight * 0.02),
                  textAlign: TextAlign.center,
                ),
              ),
              width: _screenheight * 0.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 255, 253),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color.fromARGB(69, 0, 0, 0), width: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
