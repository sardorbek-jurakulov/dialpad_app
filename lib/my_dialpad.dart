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
        // decoration: const BoxDecoration(
        //   shape: BoxShape.circle,
        //   color: Color(0xFFEEEEEE),
        // ),
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
        body: Container(
          // margin:
          // const EdgeInsets.only(left: 50, top: 80, right: 50, bottom: 80),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  top: 100,
                  right: 50,
                  bottom: 40,
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
                    TextButton(
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  top: 40,
                  right: 50,
                  bottom: 100,
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
                      children: [
                        ElevatedButton(
                          onPressed: _callNumber,
                          child: Icon(Icons.phone),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (insertedChars.length > 0) {
                                insertedChars = insertedChars.substring(
                                    0, insertedChars.length - 1);
                              }
                            });
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
      ),
    );
  }
}
