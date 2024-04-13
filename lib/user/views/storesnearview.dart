import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmalinkfend/user/models/storeviewmodel.dart';

class StoreNearView extends StatelessWidget {
  final int id;
  const StoreNearView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("$id");
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    Future<StoreViewModel> createstore(int med_id) async {
      final response = await http.post(
        Uri.parse('https://pharmalink-47enl.ondigitalocean.app/checkmed/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
        },
        body: jsonEncode(<String, int>{
          'med_id': id,
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        debugPrint("Store Created ");
        return StoreViewModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        debugPrint("Store not Created ");
        throw Exception('Failed to create album.');
      }
    }

    return Scaffold(
      body: FutureBuilder(
          future: createstore(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(children: [
                SizedBox(
                  height: _screenheight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _screenheight * 0.025),
                  child: Text(
                    "Available in: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _screenheight * 0.03),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text("Store Name"),
                          subtitle: Text("Distance: "),
                        );
                      })),
                )
              ]);
            }
          }),
    );
  }
}
