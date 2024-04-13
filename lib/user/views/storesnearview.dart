import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

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
    Future<http.Response> checkmedalbum(int med_id) {
      debugPrint("med_id: ");
      return http.post(
        Uri.parse('https://pharmalink-47enl.ondigitalocean.app/checkmed/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
        },
        body: jsonEncode(<String, int>{
          'med_id': med_id,
        }),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(left: _screenheight * 0.02),
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                      "Store Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Distance: "),
                  );
                })),
          )
        ],
      ),
    );
  }
}
