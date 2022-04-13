import 'package:flutter/material.dart';

class AppDecorations {
  static const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
  );

  static const kCardDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color(0xFFD0D0D0FF),
        blurRadius: 3.0,
      ),
    ],
  );

  static const kNeumorphicDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white10,
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black12,
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
}
