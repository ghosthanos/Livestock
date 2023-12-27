import 'package:flutter/material.dart';
import 'package:livestock/pages/about_page.dart';
import 'package:livestock/pages/de-worming.dart';
import 'package:livestock/pages/feeding.dart';
import 'package:livestock/pages/homepage.dart';
import 'package:livestock/pages/insem.dart';
import 'package:livestock/pages/pregnancy.dart';
import 'package:livestock/pages/puberty.dart';

class Cow {
  final String id;

  Cow({required this.id});
}

class NewCowPage extends StatefulWidget {
  final Cow cow;

  NewCowPage({required this.cow});

  @override
  _NewCowPageState createState() => _NewCowPageState();
}

class _NewCowPageState extends State<NewCowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(193, 215, 172, 1),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DewormingTracker()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "De-Worming",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PregnancyTracker()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "Pregnancy",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DateOfPubertyTracker()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "Date of Puberty",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InseminationTracker()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "Insemination",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 80,
                  width: 351,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the child horizontally
                      children: [
                        Text(
                          "Feeding",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(77, 119, 34, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      //AppBar displays the id of the newly generated cow page
      
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 208, 104, 1),
        shadowColor: const Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(77, 119, 34, 1),
          iconSize: 37,
        ),
        centerTitle: true,
        title: Text(
          widget.cow.id,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
    );
  }
}
