import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreNearView extends StatelessWidget {
  const StoreNearView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: _screenheight * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(left: _screenheight * 0.025),
            child: Text(
              "Available in: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: _screenheight * 0.03),
            ),
          )
        ],
      ),
    );
  }
}
