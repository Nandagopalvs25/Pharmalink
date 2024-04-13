import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/views/pharmhome.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;

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
                      // Container(
                      //   width: _screenwidth * 0.852787,
                      //   height: _screenheight * 0.29218656,
                      //   child: Image.asset(
                      //     "assets/images/loginimg.png",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      SizedBox(
                        height: _screenheight * 0.03549828,
                      ),
                      Text(
                        "Username",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: _screenheight * 0.03124829,
                        ),
                      ),
                      SizedBox(
                        height: _screenheight * 0.0181033,
                      ),
                      Container(
                        height: _screenheight * 0.07031547,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.person_2),
                            // fillColor: AdvColors.loginfield,
                            // focusColor: AdvColors.loginfield,
                            // hoverColor: AdvColors.loginfield,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenheight * 0.0218765,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: _screenheight * 0.03124829,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: _screenheight * 0.022802811,
                      ),
                      Container(
                        height: _screenheight * 0.07031547,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.key),
                            // fillColor: AdvColors.loginfield,
                            // focusColor: AdvColors.loginfield,
                            // hoverColor: AdvColors.loginfield,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenheight * 0.0512537459,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PharmHome());
                        },
                        child: Container(
                          height: _screenheight * 0.07031547,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.32),
                            // color: AdvColors.loginbutton,
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: _screenheight * 0.03124829,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
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
