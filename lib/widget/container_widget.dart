import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container containerWidget({required String text , required TextAlign textAlign }) {
  return  Container(
    margin: EdgeInsets.all(5),
    width: double.infinity,
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 30,
        color: Colors.black,
      ),
    ),

  );
}