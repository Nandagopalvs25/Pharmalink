import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  void sendCredentials(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://pharmalink-47enl.ondigitalocean.app/auth/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      Map<String, dynamic> user = jsonDecode(response.body);
      String authtoken = user['key'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", authtoken);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create token.');
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}

class Token {
  final String token;

  const Token({required this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'token': String token,
      } =>
        Token(
          token: token,
        ),
      _ => throw const FormatException('Failed to load Token.'),
    };
  }
}
