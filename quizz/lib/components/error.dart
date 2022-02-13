import 'package:flutter/material.dart';

Padding errorData(AsyncSnapshot snapshot) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Error: ${snapshot.error}',
        ),
        const SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: const Text("Try Again"),
          onPressed: () {
            //fetchQuestions();
            //setState(() {});
          },
        )
      ],
    ),
  );
}
