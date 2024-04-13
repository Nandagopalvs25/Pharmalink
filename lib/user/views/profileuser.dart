import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmalinkfend/user/controllers/locationcontroller.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController ltc = LocationController();
    return Container(
      child: Center(
        child: TextButton(
          child: Text("Add Location"),
          onPressed: () {
            ltc.getCurrentLocation();
          },
        ),
      ),
    );
  }
}
