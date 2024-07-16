import 'package:flutter/material.dart';

class MyBox extends StatefulWidget {
  final int tipValue;
  final int tipChosen;
  final Function(int) onTap;
  const MyBox({super.key, required this.tipValue, required this.tipChosen, required this.onTap});

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
          gradient: widget.tipValue == widget.tipChosen ? const LinearGradient(colors: [Colors.black, Colors.red]) : null,
          color: widget.tipValue == widget.tipChosen ? null : Colors.white),
      child: InkWell(
        onTap: () {
          widget.onTap(widget.tipValue);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.tipValue}%",
                style: TextStyle(color: widget.tipValue == widget.tipChosen ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
