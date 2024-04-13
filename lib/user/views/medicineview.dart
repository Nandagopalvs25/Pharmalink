import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharmalinkfend/user/models/medicinemodel.dart';

class MedicineView extends StatelessWidget {
  final int id;
  const MedicineView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;

    Future<MedicineModel> fetchmodel() async {
      final response = await http.get(
          Uri.parse('https://pharmalink-47enl.ondigitalocean.app/medicine/$id'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'token 27a95e156665bd1eb8d7efccdd61072f8b4b318f',
          });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return MedicineModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: fetchmodel(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Data is loaded, display it
            MedicineModel medicine = snapshot.data!;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: _screenheight * 0.025,
                    ),
                    child: Text(
                      snapshot.data?.name ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 6, 202, 166),
                          fontSize: _screenheight * 0.03),
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(left: 30, top: 5),
                    child: Text(
                      "Paracetamol (650mg)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.007),
                    child: Text(
                      "MRP : ₹${snapshot.data?.mrp} ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: _screenheight * 0.02,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025,
                        right: _screenheight * 0.025),
                    child: Text(
                      "${snapshot.data?.description}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Text(
                      "How to Use?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025,
                        right: _screenheight * 0.025),
                    child: Text(
                      "${snapshot.data?.howtouse}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Text(
                      "Side Effects",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025,
                        right: _screenheight * 0.025),
                    child: Text(
                      "${snapshot.data?.sidef}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Text(
                      "Therapeutic Class",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025,
                        right: _screenheight * 0.025),
                    child: Text(
                      "${snapshot.data?.therapyclass}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Text(
                      "Manufacturer",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025,
                        right: _screenheight * 0.025),
                    child: Text(
                      "${snapshot.data?.manf}",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: _screenheight * 0.025,
                        top: _screenheight * 0.025),
                    child: Container(
                      width: _screenwidth * 0.2,
                      height: _screenheight * 0.04,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 202, 166),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(148, 6, 6, 6),
                                spreadRadius: 0.2,
                                blurRadius: 2)
                          ]),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
