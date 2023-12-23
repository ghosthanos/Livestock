import 'package:flutter/material.dart';
import 'package:livestock/pages/homepage.dart';
import 'package:livestock/pages/profile_page.dart';
import 'package:livestock/screens/help_center_settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 0),
                    child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                      elevation: 0,
                      onPressed: null,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Color.fromRGBO(77, 119, 34, 1),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                                color: Color.fromRGBO(77, 119, 34, 1),
                                fontSize: 22,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 100),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: Color.fromRGBO(77, 119, 34, 1),
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: null,
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Color.fromRGBO(77, 119, 34, 1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                              color: Color.fromRGBO(77, 119, 34, 1),
                              fontSize: 22,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 120),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpCenter()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Color.fromRGBO(77, 119, 34, 1),
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: null,
                    child: Icon(
                      Icons.file_copy,
                      size: 30,
                      color: Color.fromRGBO(77, 119, 34, 1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          "Files & Data",
                          style: TextStyle(
                              color: Color.fromRGBO(77, 119, 34, 1),
                              fontSize: 22,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 127),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpCenter()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Color.fromRGBO(77, 119, 34, 1),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: null,
                    child: Icon(
                      Icons.help_center,
                      size: 30,
                      color: Color.fromRGBO(77, 119, 34, 1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          "Help Center",
                          style: TextStyle(
                              color: Color.fromRGBO(77, 119, 34, 1),
                              fontSize: 22,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 126),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpCenter()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Color.fromRGBO(77, 119, 34, 1),
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(
              top: 0.0,
              left: 10,
            ),
            child: Row(
              children: [
                SizedBox(width: 20),
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: Color.fromRGBO(77, 119, 34, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 205),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.login,
                        size: 35,
                        color: Color.fromRGBO(77, 119, 34, 1),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(157, 208, 104, 1),
        shadowColor: Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Color.fromRGBO(77, 119, 34, 1),
          iconSize: 37,
        ),
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(193, 215, 172, 1),
    );
  }
}
