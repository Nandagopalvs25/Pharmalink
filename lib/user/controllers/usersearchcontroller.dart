import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharmalinkfend/user/models/searchmodel.dart';

class UserSearchController extends GetxController {
  final storage = const FlutterSecureStorage();

  TextEditingController searchController = TextEditingController();
  Future<String?> getToken() async {
    final tok = await storage.read(key: 'token');
    debugPrint(tok);
    return tok;
  }

  Future<SearchModel> sendsearch(
    String searchtext,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse(
          'https://pharmalink-47enl.ondigitalocean.app/medicinelist/?search=$searchtext'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'token $token',
      },
    );
    debugPrint("Here Goess");

    debugPrint(response.body);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      SearchModel searchmodel = SearchModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      return searchmodel;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create token.');
    }
  }
}
