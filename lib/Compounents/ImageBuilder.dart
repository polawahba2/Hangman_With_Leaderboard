import 'package:flutter/material.dart';

Widget imageBuilder(bool visible, String path, context) {
  var size = MediaQuery.of(context).size;
  return Visibility(
      visible: visible,
      child: SizedBox(
        width: size.width * 0.6,
        height: size.height * 0.27,
        child: Image.asset(path, fit: BoxFit.fill),
      ));
}
