import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:livestock/pages/individual_cow_detail.dart';
import 'package:livestock/screens/NewCowPage.dart';

class PregnancyDetails {
  final String id;
  final String breed;
  final String age;
  final String status;
  final String status2;
  final String status3;

  PregnancyDetails({
    required this.id,
    required this.breed,
    required this.age,
    required this.status,
    required this.status2,
    required this.status3,
  });
}

Color getStatusColor(String status) {
  if (status == 'P' || status == 'p') {
    return Color.fromRGBO(184, 0, 77, 1);
  } else if (status == 'I' || status == 'i') {
    return Color.fromRGBO(184, 110, 0, 1);
  } else if (status == 'W' || status == 'w') {
    return Color.fromRGBO(120, 109, 190, 1);
  } else if (status == 'D' || status == 'd') {
    return Color.fromRGBO(96, 96, 96, 1);
  } else if (status == 'L' || status == 'l') {
    return Color.fromRGBO(198, 129, 235, 1);
  } else {
    return Colors.transparent; // Default color
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllCowsDetail(),
    );
  }
}

class AllCowsDetail extends StatefulWidget {
  @override
  _AllCowsDetailState createState() => _AllCowsDetailState();
}

class _AllCowsDetailState extends State<AllCowsDetail> {
  final List<PregnancyDetails> pregnancies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(193, 215, 172, 1),
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
          "All Cows",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Id",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Breed",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final pregnancy = pregnancies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewCowPage(cow: Cow(id: pregnancy.id)),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: index % 2 == 0
                        ? const Color.fromRGBO(235, 235, 235, 1)
                        : const Color.fromARGB(255, 255, 255, 255),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // CIRCLE CONTAINER FOR STATUS 1
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 30,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getStatusColor(pregnancy.status),
                                ),
                                child: Center(
                                  child: Text(
                                    pregnancy.status,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            // CIRCLE CONTAINER FOR STATUS 2
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 30,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getStatusColor(pregnancy.status2),
                                ),
                                child: Center(
                                  child: Text(
                                    pregnancy.status2,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            // CIRCLE CONTAINER FOR STATUS 3
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 30,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getStatusColor(pregnancy.status3),
                                ),
                                child: Center(
                                  child: Text(
                                    pregnancy.status3,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              pregnancy.id,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              pregnancy.breed,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              pregnancy.age,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: pregnancies.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(77, 119, 34, 1),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddPregnancyDialog(
                onSave: (pregnancy) {
                  setState(() {
                    pregnancies.add(pregnancy);
                  });
                },
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class AddPregnancyDialog extends StatefulWidget {
  final Function(PregnancyDetails) onSave;

  AddPregnancyDialog({required this.onSave});

  @override
  _AddPregnancyDialogState createState() => _AddPregnancyDialogState();
}

class _AddPregnancyDialogState extends State<AddPregnancyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _statusController = TextEditingController();
  final _status2Controller = TextEditingController();
  final _status3Controller = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _statusController.dispose();
    _status2Controller.dispose();
    _status3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Details'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'ID',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(
                  labelText: 'Breed',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Breed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Age';
                  }
                  return null;
                },
              ),
              // Text for the "Status" label
              const Text(
                'Status',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // TextFormField for the first status
              TextFormField(
                controller: _statusController,
                decoration: const InputDecoration(
                    labelText:
                        'Status 1\n(P-pregnancy,I-insemination,\nW-weaning,D-dry,L-lactate)',
                    contentPadding: EdgeInsets.only(top: 30, bottom: 30)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter Status 1';
                  }
                  return null;
                },
              ),
              // TextFormField for the second status
              TextFormField(
                controller: _status2Controller,
                decoration: const InputDecoration(
                    labelText:
                        'Status 2\n(P-pregnancy,I-insemination,\nW-weaning,D-dry,L-lactate)',
                    contentPadding: EdgeInsets.only(top: 30, bottom: 30)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter Status 2';
                  }
                  return null;
                },
              ),
              // TextFormField for the third status
              TextFormField(
                controller: _status3Controller,
                decoration: const InputDecoration(
                    labelText:
                        'Status 3\n(P-pregnancy,I-insemination,\nW-weaning,D-dry,L-lactate)',
                    contentPadding: EdgeInsets.only(top: 30, bottom: 30)),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter Status 3';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromRGBO(77, 119, 34, 1),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(77, 119, 34, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 35,
          width: 70,
          child: TextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final pregnancy = PregnancyDetails(
                  id: _idController.text,
                  breed: _breedController.text,
                  age: _ageController.text,
                  status: _statusController.text,
                  status2: _status2Controller.text,
                  status3: _status3Controller.text,
                );
                widget.onSave(pregnancy);
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
