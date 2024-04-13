import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pharmalinkfend/pharmacy/views/inventory.dart';
import 'package:pharmalinkfend/pharmacy/views/orders.dart';
import 'package:pharmalinkfend/pharmacy/views/profileview.dart';
import 'dart:convert'; // required to encode/decode json data
import 'package:http/http.dart' as http;

class PharmController extends GetxController {
  final List<String> titles = ["Profile", "Inventory", "Orders"];
  final List<Widget> bodies = [ProfileView(), Inventory(), Orders()];
  var selectedpage = 0.obs;
  void setindex(index) {
    selectedpage.value = index;
    update();
  }

  TextEditingController searchcontroller = TextEditingController();
}
