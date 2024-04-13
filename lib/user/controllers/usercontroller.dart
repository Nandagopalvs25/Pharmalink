import 'package:get/get.dart';
import 'package:pharmalinkfend/user/views/communityuser.dart';
import 'package:pharmalinkfend/user/views/homeviewuser.dart';
import 'package:pharmalinkfend/user/views/orderviewuser.dart';
import 'package:pharmalinkfend/user/views/profileuser.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
  final List<String> titles = [
    "Shop",
    "Orders",
    "Profile",
    "Community",
  ];
  final selectedpage = 0.obs;
  final List<Widget> bodies = [
    HomeUser(),
    OrderUser(),
    ProfileUser(),
    CommunityUser(),
  ];
  void setindex(index) {
    selectedpage.value = index;
    update();
  }
}
