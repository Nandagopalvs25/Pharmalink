import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderUser extends StatelessWidget {
  const OrderUser({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _screenheight * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Your Orders",
              style: TextStyle(
                color: Color.fromARGB(255, 18, 205, 168),
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(25),
              width: _screenwidth * 0.9,
              height: _screenheight * 0.1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Dollo 650mg",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Image.asset(Icon(Icons.delete))
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 97, 201, 168)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
