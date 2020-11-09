import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
  ),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 3.0)),
);
