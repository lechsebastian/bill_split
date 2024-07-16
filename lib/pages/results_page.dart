import 'package:bill_split/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final double bill;
  final int people;
  final double tip;

  const ResultsPage({super.key, required this.bill, required this.people, required this.tip});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    var resultAmount = (widget.bill + widget.tip) / widget.people;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Result',
          style: simpleStyle,
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Colors.black, Colors.red]),
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Everyboudy should pay',
                            style: simpleStyle.copyWith(color: Colors.white, letterSpacing: 2),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${resultAmount.toStringAsFixed(2)}',
                            style: GoogleFonts.rubik(fontSize: 28, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
