import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_social_store/Base%20Scaffold/BaseScaffold.dart';

class Login_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DynamicBackground(
      child:Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // 2% margin on each side
        width: screenWidth,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 00.0),
          child: Container(
            color: const Color.fromARGB(144, 19, 19, 19),
          ),
        ),
      )
    ),
    );
  }


}



// Class to represent a ball
