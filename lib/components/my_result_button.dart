import 'package:bill_split/components/my_text_style.dart';
import 'package:bill_split/pages/results_page.dart';
import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  final double bill;
  final int people;
  final double tip;

  const ResultButton({
    super.key,
    required this.bill,
    required this.people,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(bill: bill, people: people, tip: tip),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.black, Colors.red]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'CALCULATE',
              style: simpleStyle.copyWith(color: Colors.white, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}
