// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:interactive_slider/interactive_slider.dart';

class MySlider extends StatefulWidget {
  final Function(int) onTap;
  double value;

  MySlider({super.key, required this.value, required this.onTap});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return InteractiveSlider(
      focusedHeight: 30.0,
      unfocusedHeight: 30.0,
      startIcon: const Icon(Icons.person),
      centerIcon: Text(
        widget.value.toInt().toString(),
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      endIcon: const Icon(Icons.people),
      min: 1.0,
      max: 10.0,
      gradient: const LinearGradient(colors: [Colors.black, Colors.red]),
      onChanged: (value) => setState(() => widget.onTap(value.roundToDouble().toInt())),
    );
  }
}
