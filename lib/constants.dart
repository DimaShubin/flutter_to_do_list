import 'package:flutter/material.dart';

const kColorMutedText = Color(0xFFbdbdbd);
const kColorDarkGray = Color(0xFF666666);

const kInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    ),
    labelText: 'Decoration');
