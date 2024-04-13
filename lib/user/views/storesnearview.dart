import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreNearView extends StatelessWidget {
  final int id;
  const StoreNearView({
    super.key,
    required this.id,
  });

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
