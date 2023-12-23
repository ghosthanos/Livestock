import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class InseminationDetails {
  String slNo;
  final String semenType;
  final String date;
  final String handledBy;
  final String remarks;
  final String breed; // Added breed
  final String inseminationBy; // Added inseminationBy

  InseminationDetails({
    required this.slNo,
    required this.semenType,
    required this.date,
    required this.handledBy,
    required this.remarks,
    required this.breed,
    required this.inseminationBy,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InseminationTracker(),
    );
  }
}

class InseminationTracker extends StatefulWidget {
  @override
  _InseminationTrackerState createState() => _InseminationTrackerState();
}

class _InseminationTrackerState extends State<InseminationTracker> {
  final List<InseminationDetails> inseminations = [];
  int slNoCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 215, 172, 1),
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
        title: Text(
          "Insemination",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: inseminations.length,
        itemBuilder: (context, index) {
          final insemination = inseminations[index];
          return ListTile(
            tileColor: index % 2 == 0
                ? Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title: Text('Sl No: ${insemination.slNo}',
                style: TextStyle(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semen Type: ${insemination.semenType}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Date: ${insemination.date}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Text('Handled By: ${insemination.handledBy}',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Text('Remarks: ${insemination.remarks}',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Text('Breed: ${insemination.breed}',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Text('Insemination By: ${insemination.inseminationBy}',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(77, 119, 34, 1),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddInseminationDialog(
                slNoCounter: slNoCounter,
                onSave: (insemination) {
                  setState(() {
                    inseminations.add(insemination);
                    slNoCounter++;
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

class AddInseminationDialog extends StatefulWidget {
  final int slNoCounter;
  final Function(InseminationDetails) onSave;

  AddInseminationDialog({required this.slNoCounter, required this.onSave});

  @override
  _AddInseminationDialogState createState() => _AddInseminationDialogState();
}

class _AddInseminationDialogState extends State<AddInseminationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _semenTypeController = TextEditingController();
  final _dateController = TextEditingController();
  final _handledByController = TextEditingController();
  final _remarksController = TextEditingController();
  final _breedController = TextEditingController(); // Added breed controller
  final _inseminationByController =
      TextEditingController(); // Added inseminationBy controller

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Insemination'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sl No: ${widget.slNoCounter}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _semenTypeController,
                decoration: const InputDecoration(
                  labelText: 'Bull id',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Semen Type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _handledByController,
                decoration: const InputDecoration(labelText: 'Handled By'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Handled By';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _remarksController,
                decoration: const InputDecoration(labelText: 'Remarks'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Remarks';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _breedController, // Added breed field
                decoration: const InputDecoration(labelText: 'Breed'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Breed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller:
                    _inseminationByController, // Added inseminationBy field
                decoration: const InputDecoration(labelText: 'Insemination By'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Insemination By';
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
                final insemination = InseminationDetails(
                  slNo: widget.slNoCounter.toString(),
                  semenType: _semenTypeController.text,
                  date: _dateController.text,
                  handledBy: _handledByController.text,
                  remarks: _remarksController.text,
                  breed: _breedController.text, // Added breed value
                  inseminationBy: _inseminationByController
                      .text, // Added inseminationBy value
                );
                widget.onSave(insemination);
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
