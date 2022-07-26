import "package:flutter/material.dart";

class MyDialpad extends StatefulWidget {
  const MyDialpad({Key? key}) : super(key: key);

  @override
  State<MyDialpad> createState() => _MyDialpadState();
}

class _MyDialpadState extends State<MyDialpad> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: []),
      ),
    );
  }
}
