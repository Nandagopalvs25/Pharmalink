import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmalinkfend/user/models/searchmodel.dart';

class UserSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Future<List<SearchModel>> sendsearch(
    String searchtext,
  ) async {
    var url = Uri.parse(
        "https://pharmalink-47enl.ondigitalocean.app/medicinelist/?search=au");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
    });
    debugPrint("Here Goess");

    debugPrint(response.body);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      final List body = json.decode(response.body);
      final meds = body.map((e) => SearchModel.fromJson(e)).toList();

      return meds;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create token.');
    }
  }
}
