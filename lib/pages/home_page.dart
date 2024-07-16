// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bill_split/my_widgets/my_box.dart';
import 'package:bill_split/my_widgets/my_button.dart';
import 'package:bill_split/my_widgets/my_result_button.dart';
import 'package:bill_split/my_widgets/my_slider.dart';
import 'package:bill_split/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double tip = 0.00;
  int people = 1;
  int tipChosen = 0;
  String bill = '0.00';

  void setSliderValue(int value) {
    setState(() {
      people = value;
    });
  }

  void setTipValue(int value) {
    setState(() {
      tipChosen = value;
      tip = calculateTip(bill, tipChosen);
    });
  }

  void setBill(String button) {
    updateBill(button, bill, tipChosen, (updatedBill) {
      setState(() {
        bill = updatedBill;
        updateTip();
      });
    });
  }

  void updateTip() {
    setState(() {
      tip = calculateTip(bill, tipChosen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Split Bill',
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
                  gradient: LinearGradient(colors: [Colors.black, Colors.red]),
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
                            'TOTAL',
                            style: simpleStyle.copyWith(color: Colors.white, letterSpacing: 2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$$bill',
                            style: GoogleFonts.rubik(fontSize: 28, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BILL',
                                style: simpleStyle,
                              ),
                              Text(
                                'PEOPLE',
                                style: simpleStyle,
                              ),
                              Text(
                                'TIP',
                                style: simpleStyle,
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$$bill',
                                style: simpleStyle,
                              ),
                              Text(
                                people.toInt().toString(),
                                style: simpleStyle,
                              ),
                              Text(
                                '\$${tip.toStringAsFixed(2)}',
                                style: simpleStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            MySlider(
              value: people.toDouble(),
              onTap: setSliderValue,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tipsPercentage
                  .map((tip) => MyBox(
                        tipValue: tip,
                        tipChosen: tipChosen,
                        onTap: setTipValue,
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.5),
                  itemBuilder: (BuildContext context, index) {
                    return MyButton(
                      buttonText: buttons[index],
                      onTap: () {
                        setBill(buttons[index]);
                      },
                    );
                  }),
            ),
            ResultButton(
              bill: bill.isEmpty ? 0 : double.parse(bill),
              people: people,
              tip: tip,
            ),
          ],
        ),
      ),
    );
  }
}
