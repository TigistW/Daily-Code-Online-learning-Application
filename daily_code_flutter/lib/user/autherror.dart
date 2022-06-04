import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: AlertDialog(
        title: Text("ERROR"),
        content: Text("Unable to find the user....USE NOT REGISTERED"),
      )),
    );
  }
}
