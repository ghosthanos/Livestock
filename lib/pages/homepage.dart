import 'package:flutter/material.dart';
import 'package:livestock/pages/all_cows_details.dart';
import 'package:livestock/pages/individual_cow_detail.dart';
import 'package:livestock/pages/profile_page.dart';
import 'package:livestock/pages/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 10);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 40,
          backgroundColor: const Color.fromARGB(0, 255, 0, 0),
          title: Center(
            child: Image.asset(
              'images/app_logo.png',
              height: 40,
              width: 40,
            ),
          ),
          elevation: 0,
          centerTitle: true, // Center the title horizontally
        ),
        bottomNavigationBar: Container(
          height: 90,
          child: BottomNavigationBar(
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0,
            type: BottomNavigationBarType.fixed, // Set the type to fixed

            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }
              if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }

              if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icons/home.png',
                  width: 30,
                  height: 22,
                  color: const Color.fromRGBO(77, 119, 34, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icons/bell.png',
                  width: 30,
                  height: 22,
                  color: const Color.fromRGBO(77, 119, 34, 1),
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'icons/settings.png',
                  width: 30,
                  height: 22,
                  color: const Color.fromRGBO(77, 119, 34, 1),
                ),
                label: 'Settings',
              ),
            ],
            selectedItemColor: const Color.fromRGBO(77, 119, 34, 1),
            unselectedItemColor: const Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(193, 215, 172, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 17,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good Morning",
                                    style: TextStyle(
                                      color:
                                          const Color.fromRGBO(77, 119, 34, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              22,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Text(
                                    "Have a nice day!",
                                    style: TextStyle(
                                      color:
                                          const Color.fromRGBO(77, 119, 34, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.8,
                            ),
                            SizedBox(
                              height: 50,
                              child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 0.7),
                                elevation: 0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()));
                                },
                                child: const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Color.fromRGBO(77, 119, 34, 1),
                                ),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.89,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      borderRadius:
                          BorderRadius.circular(12), // Set the border radius
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.search,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //the list view begins/////////////////////////////////////////////////////

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualCowDetail()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndividualCowDetail()),
                          );
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Image.asset(
                                'images/cow.png',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Calf',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    '150',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                            ),
                            Transform.rotate(
                              angle: 180 *
                                  3.14159265359 /
                                  180, // Rotate 45 degrees (you can adjust the angle)
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualCowDetail()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndividualCowDetail()),
                          );
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Image.asset(
                                'images/cow.png',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Heifer',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    '150',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                            ),
                            Transform.rotate(
                              angle: 180 *
                                  3.14159265359 /
                                  180, // Rotate 45 degrees (you can adjust the angle)
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCowsDetail()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCowsDetail()),
                          );
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Image.asset(
                                'images/cow.png',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Cow',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    '150',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22,
                            ),
                            Transform.rotate(
                              angle: 180 *
                                  3.14159265359 /
                                  180, // Rotate 45 degrees (you can adjust the angle)
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //old notification begins here...
                  Container(
                    width: 351,
                    height: 168,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(90, 145, 34, 0.686),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 3,
                            offset: Offset(0, 4),
                            color: Color.fromARGB(170, 98, 98, 98))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                          ),
                          child: const Text(
                            'Notifications',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.72, // Adjust the multiplier as needed
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(77, 119, 34, 0.72),
                                    Color.fromRGBO(77, 119, 34, 0.72),
                                    Color.fromRGBO(71, 116, 26, 0),
                                    Color.fromRGBO(77, 119, 34, 0.72),
                                    Color.fromRGBO(77, 119, 34, 0.72),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 99, 99, 99)
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: -15,
                                    offset: const Offset(0, 7),
                                  )
                                ]),
                            child: const Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  SizedBox(width: 10),
                                  Text(
                                    'CP-001 needs de-horning...',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 255, 255, 0.8),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //old notifcation ends here...
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
