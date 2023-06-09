import 'package:flutter/material.dart';
import 'package:flutter_challenge_vyqpao/ui/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaltPay Music',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
