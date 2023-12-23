import 'package:flutter/material.dart';
import 'package:livestock/pages/individual_cow_detail.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  bool _isDataSaved = false; // To track if data is saved

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
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
          "Profile",
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

        // Name
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        const SizedBox(height: 16),

        // Phone Number
        TextFormField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
        ),
        const SizedBox(height: 16),

        // Email
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 16),

        // Address
        TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(labelText: 'Address'),
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

        // Name
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Phone Number
        TextFormField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Email
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          readOnly: false,
        ),
        const SizedBox(height: 16),

        // Address
        TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(labelText: 'Address'),
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
