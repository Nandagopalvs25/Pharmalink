import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmalinkfend/user/models/storeviewmodel.dart';
import 'package:http/http.dart' as http;

class StoreNearView extends StatefulWidget {
  final int? id;
  const StoreNearView({
    super.key,
    this.id,
  });

  @override
  State<StoreNearView> createState() => _StoreNearViewState();
}

class _StoreNearViewState extends State<StoreNearView> {
  static Future<List<StoreViewModel>> getstores(int med_id) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
      },
      body: jsonEncode(<String, int>{
        'med_id': med_id,
      }),
    );
    final List body = json.decode(response.body);
    return body.map((e) => StoreViewModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<StoreViewModel>> stores = getstores(widget.id!);

    return Scaffold(
      body: Center(
        // FutureBuilder
        child: FutureBuilder<List<StoreViewModel>>(
          future: stores,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  // function to display fetched data on screen
  Widget buildPosts(List<StoreViewModel> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Text(post.name!)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.distance!)),
            ],
          ),
        );
      },
    );
  }
}
