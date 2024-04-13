import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/views/pharmhome.dart';
import 'package:pharmalinkfend/user/controllers/usersearchcontroller.dart';
import 'package:pharmalinkfend/user/models/searchmodel.dart';
import 'package:pharmalinkfend/user/views/userhome.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({super.key});

  @override
  Widget build(BuildContext context) {
    UserSearchController usc = UserSearchController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  Search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 212, 162),
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: usc.searchController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 238, 255, 253),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          Future<List<SearchModel>> postsFuture =
                              usc.sendsearch(usc.searchController.text);
                        },
                        child: Icon(Icons.search)),
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
              SizedBox(height: 10),
              FutureBuilder(
                  future: usc.sendsearch(usc.searchController.text),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data?[index]?.name ?? ''),
                              subtitle: Text(
                                  snapshot.data?[index]?.price.toString() ??
                                      ''),
                            );
                          });
                    } else {
                      return Center(child: Text("No data found"));
                    }
                  }))
            ]),
      ),
    );
  }
}
