import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_social_store/Base%20Scaffold/BaseScaffold.dart';

class Login_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DynamicBackground(
      content: Column(
        children: [
          AppBar(
            title: Text(
              "Blaze",
              style: TextStyle(
                color: Colors.white, // Ensure text color is explicitly set
                fontSize: 32, // Set a specific font size
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          Center(
              child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02), // 2% margin on each side
            width: screenWidth,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 00.0),
              child: Container(
                  color: const Color.fromARGB(144, 19, 19, 19),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
                    child: Column(
                      children: [
                      ],
                    ),
                  )),
            ),
          )),
        ],
      ),
    );
  }
}

// Class to represent a ball
