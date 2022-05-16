import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed, required this.icon, this.color=Colors.white, this.text=""});
  final GestureTapCallback onPressed;
  final  Color color;
  final  String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: color,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:  <Widget>[
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(text)
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}