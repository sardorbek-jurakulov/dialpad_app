import "package:flutter/material.dart";
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyDialpad extends StatefulWidget {
  const MyDialpad({Key? key}) : super(key: key);

  @override
  State<MyDialpad> createState() => _MyDialpadState();
}

class _MyDialpadState extends State<MyDialpad> {
  String insertedChars = "";

  @override
  Widget build(BuildContext context) {
    Widget createDealpadButton(String buttonNumber,
        [String buttonLetters = ""]) {
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFEEEEEE),
        ),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                insertedChars = insertedChars + buttonNumber;
              });
            },
            child: Column(
              children: [
                Text(buttonNumber),
                Text(buttonLetters),
              ],
            )),
      );
    }

    Future _callNumber() async {
      String number = insertedChars; //set the number here
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(insertedChars),
                  const Text("Add Number"),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      createDealpadButton("1"),
                      createDealpadButton("2", "ABC"),
                      createDealpadButton("3", "DEF"),
                    ],
                  ),
                  Row(
                    children: [
                      createDealpadButton("4", "GHI"),
                      createDealpadButton("5", "JKL"),
                      createDealpadButton("6", "MNO"),
                    ],
                  ),
                  Row(
                    children: [
                      createDealpadButton("7", "PQRS"),
                      createDealpadButton("8", "TUV"),
                      createDealpadButton("9", "WXYZ"),
                    ],
                  ),
                  Row(
                    children: [
                      createDealpadButton("*"),
                      createDealpadButton("0", "+"),
                      createDealpadButton("#"),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _callNumber,
                        child: Icon(Icons.phone),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
