import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<List> fetchAlbum(int med_id) async {
  final response = await http.post(
    Uri.parse('https://pharmalink-47enl.ondigitalocean.app/checkmed/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
    },
    body: jsonEncode(<String, int>{
      'med_id': med_id,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var data = jsonDecode(response.body);
    print(data[0]['distance']);

    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  String? name;
  double? distance;

  Album({this.name, this.distance});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['distance'] = this.distance;

    return data;
  }
}

class StoresNearView extends StatefulWidget {
  final int? id;
  const StoresNearView({
    super.key,
    required this.id,
  });

  @override
  State<StoresNearView> createState() => _StoresNearViewState();
}

class _StoresNearViewState extends State<StoresNearView> {
  late Future<List<dynamic>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Available in',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        final dist = snapshot.data?[index]['distance'];

                        return ListTile(
                          title: Text(snapshot.data?[index]['name']),
                          subtitle: Text("${dist.toString()} km"),
                        );
                      })));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
// Text(snapshot.data?[0]['name'].toString() ?? "")