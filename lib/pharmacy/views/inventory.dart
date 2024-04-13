import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalinkfend/pharmacy/controllers/pharmcontroller.dart';
import 'package:get/get.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    final PharmController c = Get.find();
    return Container(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              controller: c.searchcontroller,
              decoration: InputDecoration(
                hintText: "Search",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color.fromARGB(255, 18, 205, 168),
                )),
                prefixIcon: Icon(Icons.search),
                suffixIcon: GestureDetector(
                    onTap: () {}, child: Icon(Icons.filter_alt_rounded)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
