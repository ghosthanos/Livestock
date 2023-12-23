import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PregnancyDetails {
  String slNo;
  final String handledBy;
  final String date;
  final String status;

  PregnancyDetails({
    required this.slNo,
    required this.handledBy,
    required this.date,
    required this.status,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PregnancyTracker(),
    );
  }
}

class PregnancyTracker extends StatefulWidget {
  @override
  _PregnancyTrackerState createState() => _PregnancyTrackerState();
}

class _PregnancyTrackerState extends State<PregnancyTracker> {
  final List<PregnancyDetails> pregnancies = [];
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
          "Pregnancy",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: pregnancies.length,
        itemBuilder: (context, index) {
          final pregnancy = pregnancies[index];
          return ListTile(
            tileColor: index % 2 == 0
                ? Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title: Text('Sl No: ${pregnancy.slNo}',
                style: TextStyle(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Handled By: ${pregnancy.handledBy}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Date: ${pregnancy.date}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Text('Status: ${pregnancy.status}',
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
              builder: (context) => AddPregnancyDialog(
                slNoCounter: slNoCounter,
                onSave: (pregnancy) {
                  setState(() {
                    pregnancies.add(pregnancy);
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

class AddPregnancyDialog extends StatefulWidget {
  final int slNoCounter;
  final Function(PregnancyDetails) onSave;

  AddPregnancyDialog({required this.slNoCounter, required this.onSave});

  @override
  _AddPregnancyDialogState createState() => _AddPregnancyDialogState();
}

class _AddPregnancyDialogState extends State<AddPregnancyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _handledByController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Pregnancy'),
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
                controller: _handledByController,
                decoration: const InputDecoration(
                  labelText: 'Handled By',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Handled By';
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
                controller: _statusController,
                decoration: const InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the Status';
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
                  slNo: widget.slNoCounter.toString(),
                  handledBy: _handledByController.text,
                  date: _dateController.text,
                  status: _statusController.text,
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
