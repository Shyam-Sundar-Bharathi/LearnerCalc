import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';

ButtonStyle myButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(10),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      )
  ),
  backgroundColor: MaterialStateProperty.resolveWith((states) => colors[colorTheme][9]),
  minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
);

InputDecoration myInputDecoration({String labelText}){
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border:OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(15),
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      fontSize: 20.0,
    ),
  );
}

Widget myAppBar(String heading){
  return AppBar(
    title: FittedBox(
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
          color: colors[colorTheme][1],
        ),
      ),
    ),
    backgroundColor: colors[colorTheme][9],
  );
}