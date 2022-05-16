import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

   Widget textField(String title,
      {bool isPassword = false,
        bool isNumber = false,
        bool enables = true,
        int? length,

        TextEditingController? textController,
        int lines = 1}) {
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
          TextFormField(
            
            enabled: enables,
            maxLines: lines,
            controller: textController,
            maxLength: length,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
            ],
            obscureText: isPassword,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }
