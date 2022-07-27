import "package:flutter/material.dart";
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class TestFeatures extends StatefulWidget {
  const TestFeatures({Key? key}) : super(key: key);

  @override
  State<TestFeatures> createState() => _TestFeaturesState();
}

class _TestFeaturesState extends State<TestFeatures> {
  @override
  Widget build(BuildContext context) {
    Future _callNumber() async {
      const number = '+998946110464'; //set the number here
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _callNumber,
          child: const Text(
            'Call Number',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
