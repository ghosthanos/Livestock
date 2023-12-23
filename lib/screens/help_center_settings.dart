import 'package:flutter/material.dart';
import 'package:livestock/pages/homepage.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 30),
        Center(
          child: Container(
            width: 360,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/building.png'),
            ),
          ),
        ),
        SizedBox(height: 30),
        const Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
          child: Column(
            children: [
              Text(
                '1)To provide the inputs required for cattle breeding in line with the breeding policy of the State',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '2)To  promote  fodder production under   field condition  to support   economic  milk production',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '3)To offer   training courses in animal husbandry and fodder production.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '4)To develop Malabari goats through the production and supply of selected breeding stock.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '5)To produce and supply good quality piglets for breeding and fattening.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(77, 119, 34, 1),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          'For more information contact: xxxxx xxxxx',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
      ]),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
          title: Container(
              height: 90,
              width: 70,
              child: Image.asset('images/app_logo.png'))),
      backgroundColor: Color.fromRGBO(193, 215, 172, 1),
    );
  }
}
