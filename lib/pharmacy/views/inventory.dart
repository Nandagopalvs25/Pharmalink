import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalinkfend/pharmacy/controllers/pharmcontroller.dart';
import 'package:get/get.dart';
import 'package:pharmalinkfend/pharmacy/views/stockview.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    final PharmController c = Get.find();
    return Container(
      child: Column(
        children: [
          TextField(
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
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  final List<String> meds = [
                    'Augmentin 625 Duo Tablet',
                    'Asthalin Syrup',
                    'Betadine 10% Solution',
                    'Dolo 650 Tablet',
                    'Ecosprin 150 Tablet',
                    'Amlong Tablet',
                    'Augmentin DDS Suspension',
                    'Betadine Powder',
                    'Joint-D Tablet',
                    'Lopamide Tablet',
                    'Moxikind-CV 625 Tablet',
                    'Genteal Eye Drop',
                    'Nodosis Tablet',
                    'Nitrosun 10 Tablet',
                    'Flutibact Ointment',
                  ];
                  final List<int> ids = [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                  ];
                  final List<String> mrp = [
                    '₹201.71',
                    '₹16.8',
                    '₹104.16',
                    '₹30.91',
                    '₹8.79',
                    '₹43.84',
                    '₹157.3',
                    '₹131.5',
                    '₹125',
                    '₹21.2',
                    '₹154.55',
                    '₹200',
                    '₹54',
                    '₹59.5',
                    '₹214.75'
                  ];

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => StockDetails(
                          id: ids[index],
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        meds[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("MRP: ${mrp[index]}"),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
