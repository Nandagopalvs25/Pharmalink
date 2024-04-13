import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/auth/views/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmalinkfend/pharmacy/views/pharmhome.dart';
import 'package:pharmalinkfend/user/views/medicineview.dart';
import 'package:pharmalinkfend/user/views/userhome.dart';
import 'package:pharmalinkfend/user/views/usersearch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: (() => const AuthPage())),
        GetPage(name: "/pharm", page: (() => const PharmHome())),
        GetPage(name: "/user", page: (() => const UserHome()))
      ],
      title: 'PharmaLink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const AuthPage(),
    );
  }
}
