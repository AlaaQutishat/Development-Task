import 'package:development_task/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget datapicker(String title,
    VoidCallback onPressed,
    {
      TextEditingController? textController,
      }) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,fontFamily: "Cairo"),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: false,
                controller: textController,
                decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
              ),
            ),
            const SizedBox(width: 10,),
            CustomButton(
              onPressed: onPressed,
              icon: Icons.date_range,
            )
          ],
        )
      ],
    ),
  );
}
