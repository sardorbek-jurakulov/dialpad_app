import "package:flutter/material.dart";
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyDialpad extends StatefulWidget {
  const MyDialpad({Key? key}) : super(key: key);

  @override
  State<MyDialpad> createState() => _MyDialpadState();
}

class _MyDialpadState extends State<MyDialpad> {
  String insertedChars = "";
  double _visibilityStatus = 0.0;

  @override
  Widget build(BuildContext context) {
    Widget createDealpadButton(String buttonNumber,
        [String buttonLetters = ""]) {
      return Container(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFe9e9e9),
              shape: CircleBorder(),
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              setState(() {
                insertedChars = insertedChars + buttonNumber;
                _visibilityStatus = 1.0;
              });
            },
            child: Column(
              children: [
                Text(
                  buttonNumber,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF020202),
                  ),
                ),
                Text(
                  buttonLetters,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF020202),
                    letterSpacing: 3,
                  ),
                ),
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
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 50,
                top: 90,
                right: 50,
                bottom: 30,
              ),
              child: Column(
                children: [
                  Text(
                    insertedChars,
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color(0xFF020202),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Opacity(
                    opacity: _visibilityStatus,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Add Number",
                        style: TextStyle(
                          color: Color(0xFF0b7dda),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 50,
                top: 30,
                right: 50,
                bottom: 900,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createDealpadButton("1"),
                      createDealpadButton("2", "ABC"),
                      createDealpadButton("3", "DEF"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createDealpadButton("4", "GHI"),
                      createDealpadButton("5", "JKL"),
                      createDealpadButton("6", "MNO"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createDealpadButton("7", "PQRS"),
                      createDealpadButton("8", "TUV"),
                      createDealpadButton("9", "WXYZ"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createDealpadButton("*"),
                      createDealpadButton("0", "+"),
                      createDealpadButton("#"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        width: 65,
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: _callNumber,
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF94cf82),
                          shape: const CircleBorder(),
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Icon(Icons.phone, size: 32),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          primary: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            if (insertedChars.isNotEmpty) {
                              insertedChars = insertedChars.substring(
                                  0, insertedChars.length - 1);
                            }
                            if (insertedChars.isEmpty) {
                              _visibilityStatus = 0.0;
                            }
                          });
                        },
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.backspace,
                              color: Color(0xFFe9e9e9),
                            ),
                            Icon(
                              Icons.clear,
                              color: Color(0xFF020202),
                            ),
                          ],
                        ),
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
