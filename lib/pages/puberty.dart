import 'package:flutter/material.dart';

class DateOfPubertyDetails {
  String slNo;
  final String date;

  DateOfPubertyDetails({
    required this.slNo,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DateOfPubertyTracker(),
    );
  }
}

class DateOfPubertyTracker extends StatefulWidget {
  @override
  _DateOfPubertyTrackerState createState() => _DateOfPubertyTrackerState();
}

class _DateOfPubertyTrackerState extends State<DateOfPubertyTracker> {
  final List<DateOfPubertyDetails> puberties = [];
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
          "Date of Puberty",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: puberties.length,
        itemBuilder: (context, index) {
          final puberty = puberties[index];
          return ListTile(
            tileColor: index % 2 == 0
                ? Color.fromRGBO(235, 235, 235, 1)
                : const Color.fromARGB(255, 255, 255, 255),
            title:
                Text('Sl No: ${puberty.slNo}', style: TextStyle(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${puberty.date}',
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
              builder: (context) => AddDateOfPubertyDialog(
                slNoCounter: slNoCounter,
                onSave: (puberty) {
                  setState(() {
                    puberties.add(puberty);
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

class AddDateOfPubertyDialog extends StatefulWidget {
  final int slNoCounter;
  final Function(DateOfPubertyDetails) onSave;

  AddDateOfPubertyDialog({required this.slNoCounter, required this.onSave});

  @override
  _AddDateOfPubertyDialogState createState() => _AddDateOfPubertyDialogState();
}

class _AddDateOfPubertyDialogState extends State<AddDateOfPubertyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Date of Puberty'),
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
                final puberty = DateOfPubertyDetails(
                  slNo: widget.slNoCounter.toString(),
                  date: _dateController.text,
                );
                widget.onSave(puberty);
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

void main() {
  runApp(MyApp());
}
