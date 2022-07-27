import 'package:flutter/material.dart';
import "package:dial_phone_app/my_dialpad.dart";
import "package:dial_phone_app/test_features.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDialpad(),
    );
  }
}
