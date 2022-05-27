import 'package:flutter/material.dart';

Widget characterBuilder(String character, bool hidden, context) {
  var size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.05,
    width: size.width * 0.1,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.blue[400],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    ),
  );
}
