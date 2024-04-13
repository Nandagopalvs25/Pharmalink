import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/views/pharmhome.dart';
import 'package:pharmalinkfend/user/views/userhome.dart';
import 'package:pharmalinkfend/auth/controllers/logincontroller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    LoginController lgn = LoginController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _screenheight,
          width: _screenwidth,
          child: Padding(
            padding: EdgeInsets.only(
              top: _screenheight * 0.03814,
              left: _screenwidth * 0.04843318,
              right: _screenwidth * 0.04843318,
            ),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      Center(
                        child: Text(
                          "PharmaLink",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 18, 205, 168),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: _screenwidth * 0.852787,
                      //   height: _screenheight * 0.29218656,
                      //   child: Image.asset(
                      //     "assets/images/loginimg.png",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      SizedBox(
                        height: _screenheight * 0.05549828,
                      ),
                      // Text(
                      //   "Username",
                      //   textAlign: TextAlign.left,
                      //   style: TextStyle(
                      //     fontSize: _screenheight * 0.025,
                      //     fontWeight: FontWeight.w700,
                      //     //fontFamily:
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: _screenheight * 0.0181033,
                      // ),
                      Container(
                        height: _screenheight * 0.07031547,
                        child: TextField(
                          controller: lgn.usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.person_2),
                            fillColor: Color.fromARGB(255, 238, 255, 253),

                            // focusColor: AdvColors.loginfield,
                            // hoverColor: AdvColors.loginfield,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 0.1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            hintText: "Username",
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: _screenheight * 0.0218765,
                      // ),
                      // Text(
                      //   "Password",
                      //   style: TextStyle(
                      //     fontSize: _screenheight * 0.025,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                      // SizedBox(
                      //   height: _screenheight * 0.022802811,
                      // ),
                      Container(
                        height: _screenheight * 0.07031547,
                        child: TextField(
                          controller: lgn.passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.key),
                            fillColor: Color.fromARGB(255, 238, 255, 253),
                            // focusColor: AdvColors.loginfield,
                            // hoverColor: AdvColors.loginfield,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 0.1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(width: 0.5)),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenheight * 0.0512537459,
                      ),
                      GestureDetector(
                        onTap: () {
                          lgn.sendCredentials(lgn.usernameController.text,
                              lgn.passwordController.text);
                          Get.to(() => const PharmHome());
                        },
                        child: Container(
                          height: _screenheight * 0.05031547,
                          // width: _screenwidth * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromARGB(255, 18, 205, 168),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: _screenheight * 0.02,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Text("User"),
                        onPressed: () {
                          Get.to(() => const UserHome());
                        },
                      ),
                      TextButton(
                        child: Text("Pharmacy"),
                        onPressed: () {
                          Get.to(() => const PharmHome());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
