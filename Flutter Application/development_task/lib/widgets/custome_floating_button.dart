import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget floatingButton(String title,
    VoidCallback onPressed, IconData icon) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    child: FloatingActionButton(
      onPressed: onPressed,
      tooltip: title,
      child:  Icon(icon),
    ),
  );
}
