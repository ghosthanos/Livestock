import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class DewormingDetails {
  String slNo;
  final String date;

  DewormingDetails({
    required this.slNo,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DewormingTracker(),
    );
  }
}

class DewormingTracker extends StatefulWidget {
  @override
  _DewormingTrackerState createState() => _DewormingTrackerState();
}

class _DewormingTrackerState extends State<DewormingTracker> {
  final List<DewormingDetails> dewormings = [];
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
          "De-Worming",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dewormings.length,
        itemBuilder: (context, index) {
          final deworming = dewormings[index];
          return ListTile(
            tileColor: index % 2 == 0
                ? Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title: Text('Sl No: ${deworming.slNo}',
                style: TextStyle(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${deworming.date}',
                    style: const TextStyle(
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
              builder: (context) => AddDewormingDialog(
                onSave: (deworming) {
                  deworming.slNo = slNoCounter.toString();
                  setState(() {
                    dewormings.add(deworming);
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

class AddDewormingDialog extends StatefulWidget {
  final Function(DewormingDetails) onSave;

  AddDewormingDialog({required this.onSave});

  @override
  _AddDewormingDialogState createState() => _AddDewormingDialogState();
}

class _AddDewormingDialogState extends State<AddDewormingDialog> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add De-Worming'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying the Sl No is not necessary in the dialog

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
                final deworming = DewormingDetails(
                  slNo: '', // Placeholder, will be updated in onSave
                  date: _dateController.text,
                );
                widget.onSave(deworming);
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
