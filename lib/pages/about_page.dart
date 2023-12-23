import 'package:flutter/material.dart';
import 'package:livestock/pages/individual_cow_detail.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _pubertyController = TextEditingController();
  TextEditingController _cullingDateController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();

  bool _isDataSaved = false; // To track if data is saved

  @override
  void dispose() {
    _idController.dispose();
    _genderController.dispose();
    _weightController.dispose();
    _pubertyController.dispose();
    _cullingDateController.dispose();
    _remarksController.dispose();
    super.dispose();
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
        title: const Text(
          "About",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
      body: _isDataSaved ? _buildSavedDataForm() : _buildInputForm(),
    );
  }

  // Function to build the input form
  Widget _buildInputForm() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // ID
        TextFormField(
          controller: _idController,
          decoration: const InputDecoration(labelText: 'ID'),
        ),
        const SizedBox(height: 16),

        // Gender
        TextFormField(
          controller: _genderController,
          decoration: const InputDecoration(labelText: 'Gender'),
        ),
        const SizedBox(height: 16),

        // Weight
        TextFormField(
          controller: _weightController,
          decoration: const InputDecoration(labelText: 'Weight'),
        ),
        const SizedBox(height: 16),

        // Puberty
        TextFormField(
          controller: _pubertyController,
          decoration: const InputDecoration(labelText: 'Puberty'),
        ),
        const SizedBox(height: 16),

        // Date of Culling
        TextFormField(
          controller: _cullingDateController,
          decoration: const InputDecoration(labelText: 'Date of Culling'),
        ),
        const SizedBox(height: 16),

        // Remarks
        TextFormField(
          controller: _remarksController,
          decoration: const InputDecoration(labelText: 'Remarks'),
        ),
        const SizedBox(height: 16),

        // Save Button
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Information saved!"),
              ),
            );
            setState(() {
              _isDataSaved = true;
            });
          },
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromRGBO(77, 119, 34, 1), // Change the button color
            onPrimary:
                Color.fromRGBO(167, 219, 150, 1), // Change the text color
            textStyle: const TextStyle(
              fontFamily: 'Poppins', // Change the font family
              fontSize: 16.0,
            ),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }

  // Function to build the saved data form
  // Function to build the saved data form
  Widget _buildSavedDataForm() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // ID
        TextFormField(
          controller: _idController,
          decoration: const InputDecoration(labelText: 'ID'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Gender
        TextFormField(
          controller: _genderController,
          decoration: const InputDecoration(labelText: 'Gender'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Weight
        TextFormField(
          controller: _weightController,
          decoration: const InputDecoration(labelText: 'Weight'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Puberty
        TextFormField(
          controller: _pubertyController,
          decoration: const InputDecoration(labelText: 'Puberty'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Date of Culling
        TextFormField(
          controller: _cullingDateController,
          decoration: const InputDecoration(labelText: 'Date of Culling'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Remarks
        TextFormField(
          controller: _remarksController,
          decoration: const InputDecoration(labelText: 'Remarks'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Edit Button
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isDataSaved = false; // Switch to edit mode
            });
          },
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromRGBO(77, 119, 34, 1), // Change the button color
            onPrimary:
                Color.fromRGBO(167, 219, 150, 1), // Change the text color
            textStyle: const TextStyle(
              fontFamily: 'Poppins', // Change the font family
              fontSize: 16.0,
            ),
          ),
          child: const Text('Edit'),
        ),
      ],
    );
  }
}
