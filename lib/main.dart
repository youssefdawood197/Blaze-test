import 'package:flutter/material.dart';
import 'package:test_social_store/Authntication/Login_Page.dart';

import 'Authntication/Register_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login_Page(),
      routes: {
        Login_Page.routeName: (context) => Login_Page(),
        '/register': (context) => Register_Page(),
      },    );
  }
}