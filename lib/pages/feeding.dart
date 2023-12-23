/*import 'package:flutter/material.dart';
import 'package:livestock/pages/individual_cow_detail.dart';

class FeedingDetails {
  final int age; // weeks
  final int body_wt;
  final int milk_qty;
  final int calf_starter_qty;
  final int grass_qty;

  FeedingDetails(
      {required this.age,
      required this.body_wt,
      required this.milk_qty,
      required this.calf_starter_qty,
      required this.grass_qty
      });
}

Color getStatusColor(int age, int body_wt, int milk_qty) {
  if (age < 2 &&
      body_wt < 30 &&
      body_wt > 25 &&
      milk_qty > 2.5 &&
      milk_qty < 3) {
    return const Color.fromRGBO(184, 0, 77, 1);
  } else if (age >= 2 &&
      age < 4 &&
      body_wt < 40 &&
      body_wt > 30 &&
      milk_qty > 3 &&
      milk_qty < 3.5) {
    return const Color.fromRGBO(184, 110, 0, 1);
  } else if (age >= 4 &&
      age < 6 &&
      body_wt < 45 &&
      body_wt > 40 &&
      milk_qty > 3.5 &&
      milk_qty < 4) {
    return const Color.fromRGBO(120, 109, 190, 1);
  } else if (age >= 6 &&
      age < 8 &&
      body_wt < 50 &&
      body_wt > 45 &&
      milk_qty > 3 &&
      milk_qty < 3.25) {
    return const Color.fromRGBO(96, 96, 96, 1);
  } else if (age >= 8 &&
      age < 10 &&
      body_wt < 60 &&
      body_wt > 50 &&
      milk_qty > 2.5 &&
      milk_qty < 2.75) {
    return const Color.fromRGBO(53, 57, 119, 1);
  } else if (age >= 10 &&
      age < 12 &&
      body_wt < 70 &&
      body_wt > 60 &&
      milk_qty > 2.75 &&
      milk_qty < 3.25) {
    return const Color.fromRGBO(190, 184, 29, 1);
  } else if (age >= 12 && age < 16 && body_wt < 80 && body_wt > 70) {
    return const Color.fromRGBO(247, 162, 242, 1);
  } else if (age >= 16 && age < 20 && body_wt < 90 && body_wt > 80) {
    return const Color.fromRGBO(77, 10, 101, 1);
  } else if (age >= 20 && age < 24 && body_wt < 120 && body_wt > 90) {
    return const Color.fromRGBO(25, 181, 119, 1);
  } else {
    return Colors.transparent; // Default color
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedingDetail(),
    );
  }
}

class FeedingDetail extends StatefulWidget {
  @override
  _FeedingDetailState createState() => _FeedingDetailState();
}

class _FeedingDetailState extends State<FeedingDetail> {
  final List<FeedingDetails> feedings = [];

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController milkController = TextEditingController();

  Color? selectedColor;

  void updateStatusColor() {
    int age = int.tryParse(ageController.text) ?? 0;
    int weight = int.tryParse(weightController.text) ?? 0;
    int milk = int.tryParse(milkController.text) ?? 0;

    Color color = getStatusColor(age, weight, milk);

    setState(() {
      selectedColor = color;
    });
  }

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
          "Feeding details",
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
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Weight",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Milk",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "  Calf\nstarter",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Green\ngrass",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final feeding = feedings[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualCowDetail(),
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
                        // Circle container for Status
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: getStatusColor(
                                feeding.age,
                                feeding.body_wt,
                                feeding.milk_qty,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                feeding.age.toString(),
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
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              feeding.body_wt.toString(),
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
                              feeding.milk_qty.toString(),
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ),
                        // Add Calf Starter and Green Grass TextFields here
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              feeding.calf_starter_qty as String,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: selectedColor ?? Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                            child: Text(
                              feeding.grass_qty,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: selectedColor ?? Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: feedings.length,
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
              builder: (context) => AddFeedingDialog(
                onSave: (feeding) {
                  setState(() {
                    feedings.add(feeding);
                  });
                },
                onColorUpdated: () {
                  updateStatusColor();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AddFeedingDialog extends StatefulWidget {
  final Function(FeedingDetails) onSave;
  final VoidCallback? onColorUpdated;

  AddFeedingDialog({required this.onSave, this.onColorUpdated});

  @override
  _AddFeedingDialogState createState() => _AddFeedingDialogState();
}

class _AddFeedingDialogState extends State<AddFeedingDialog> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _body_wtController = TextEditingController();
  final _milk_qtyController = TextEditingController();
  final _calf_starter_qtyController = TextEditingController();
  final _grass_qtyController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _body_wtController.dispose();
    _milk_qtyController.dispose();
    _calf_starter_qtyController.dispose();
    _grass_qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Feeding'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _body_wtController,
                decoration: const InputDecoration(
                  labelText: 'Weight(kg)',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Weight';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _milk_qtyController,
                decoration: const InputDecoration(labelText: 'Milk(kg)'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Milk quantity';
                  }
                  return null;
                },
              ),
              // Remove Calf Starter and Green Grass TextFields
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
                final feeding = FeedingDetails(
                  age: int.parse(_ageController.text),
                  body_wt: int.parse(_body_wtController.text),
                  milk_qty: int.parse(_milk_qtyController.text),
                );
                widget.onSave(feeding);
                Navigator.of(context).pop();
                // Trigger color update callback
                widget.onColorUpdated?.call();
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
*/