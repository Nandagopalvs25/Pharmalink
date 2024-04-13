import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/views/pharmhome.dart';
import 'package:pharmalinkfend/user/controllers/usersearchcontroller.dart';
import 'package:pharmalinkfend/user/models/searchmodel.dart';
import 'package:pharmalinkfend/user/views/medicineview.dart';
import 'package:pharmalinkfend/user/views/userhome.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    //UserSearchController usc = UserSearchController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _screenheight * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 212, 162),
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              height: _screenheight * 0.02,
            ),
            TextField(
              // controller: usc.searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 238, 255, 253),
                  suffixIcon:
                      GestureDetector(onTap: () {}, child: Icon(Icons.search)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(width: 0.1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(width: 0.5)),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  hintText: "eg: Paracetamol"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "Paracetamol",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("MRP: ₹30.91"),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
