import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_social_store/Base%20Scaffold/BaseScaffold.dart';

class Login_Page extends StatelessWidget {
  static const routeName = 'LoginPage'; // Define the route name for this page

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures the body extends behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Removes shadow
        title: Text(
          "Welcome", // Title of the AppBar
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Centers the title
      ),
      body: DynamicBackground(
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
                  child: LoginForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  void _navigateToSignUp() {
    // Implement navigation logic to the Sign-Up page
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Email Field
          TextFormField(
            controller: _emailController,
            style: TextStyle(color: Colors.white), // Input text color set to white
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              labelStyle: TextStyle(color: Colors.white), // Label color
              hintStyle: TextStyle(color: Colors.white70), // Hint color
              prefixIcon: Icon(Icons.email, color: Colors.white), // Add email icon
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
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
            style: TextStyle(color: Colors.white), // Input text color set to white
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              labelStyle: TextStyle(color: Colors.white), // Label color
              hintStyle: TextStyle(color: Colors.white70), // Hint color
              prefixIcon: Icon(Icons.lock, color: Colors.white), // Add lock icon
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
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
          // Submit Button
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Login'),
          ),
          SizedBox(height: 16.0),
          // "Don't have an account?" Button
          TextButton(
            onPressed: _navigateToSignUp,
            child: Text(
              "Don't have an account? Sign up",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}