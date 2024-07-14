// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bill_split/components/my_text_style.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final onTap;
  const MyButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            buttonText,
            style: simpleStyle.copyWith(color: buttonText == 'DEL' ? Colors.red : null),
          ),
        ),
      ),
    );
  }
}
