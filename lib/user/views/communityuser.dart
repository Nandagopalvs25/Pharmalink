import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityUser extends StatelessWidget {
  const CommunityUser({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _screenheight * 0.035, bottom: _screenheight * 0.03),
              child: Text(
                "News and Updates",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _screenheight * 0.03,
                  color: Color.fromARGB(255, 0, 212, 162),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  width: _screenheight * 0.4,
                  height: _screenheight * 0.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 16, 158, 113))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Government alerts on Meftal; all about adverse reaction the painkiller can cause",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _screenheight * 0.015),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Government has issued alert about an adverse reaction of Meftal. The syndrome causes a diverse array of symptoms, from 2 to 8 weeks after...",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: _screenheight * 0.015),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  width: _screenheight * 0.4,
                  height: _screenheight * 0.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 16, 158, 113))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Government bans 14 combination drugs used to treat common ailments",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _screenheight * 0.015),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Fourteen fixed-dose combinations (FDC) medicines found to lack therapeutic relevance have been banned by the Central Government through a...",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: _screenheight * 0.015),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  width: _screenheight * 0.4,
                  height: _screenheight * 0.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 16, 158, 113))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "P&G stops selling Vicks Action 500 Extra in India after ban",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _screenheight * 0.015),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "US consumer health giant Procter & Gamble's (PG.N) India unit said on Tuesday it had stopped manufacture and sale of its cough-and-cold...",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: _screenheight * 0.015),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
