import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_social_store/Base%20Scaffold/BaseScaffold.dart';

class Register_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures the body extends behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Removes shadow
        title: Text(
          "Join Blaze", // Title of the AppBar
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Centers the title
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: DynamicBackground(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight), // Adds padding to account for AppBar
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                width: screenWidth,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(144, 19, 19, 19),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                      child: RegisterForm(), // Scrollable Form
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  DateTime? _birthDate;
  String? _gender;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }

      // Perform registration logic here
      print('First Name: ${_firstNameController.text}');
      print('Last Name: ${_lastNameController.text}');
      print('Username: ${_usernameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone Number: ${_phoneNumberController.text}');
      print('Gender: $_gender');
      print('Birth Date: $_birthDate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First Name Field
          TextFormField(
            controller: _firstNameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'First Name',
              hintText: 'Enter your first name',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Last Name Field
          TextFormField(
            controller: _lastNameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Last Name',
              hintText: 'Enter your last name',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Username Field
          TextFormField(
            controller: _usernameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Email Field
          TextFormField(
            controller: _emailController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Password Field
          TextFormField(
            controller: _passwordController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Confirm Password Field
          TextFormField(
            controller: _confirmPasswordController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Re-enter your password',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Gender Field
          DropdownButtonFormField<String>(
            dropdownColor: Color.fromARGB(240, 19, 19, 19),
            value: _gender,
            items: ['Male', 'Female', 'Other']
                .map((gender) => DropdownMenuItem(
              value: gender,
              child: Text(gender, style: TextStyle(color: Colors.white)),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Gender',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select your gender';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Phone Number Field
          TextFormField(
            controller: _phoneNumberController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true, // Fill color for input field
              fillColor: Color.fromARGB(20, 255, 255, 255), // Light opacity

            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Birth Date Field
// Birth Date Field
          TextButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _birthDate = pickedDate;
                });
              }
            },
            child: Text(
              _birthDate == null
                  ? 'Select Birth Date'
                  : 'Birth Date: ${_birthDate!.day.toString().padLeft(2, '0')}-${_birthDate!.month.toString().padLeft(2, '0')}-${_birthDate!.year}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16.0),
          // Submit Button
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}