import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle simpleStyle = GoogleFonts.rubik(fontWeight: FontWeight.bold);

final List<String> buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', 'DEL'];
final List<int> tipsPercentage = [0, 5, 10, 15];

double calculateTip(String bill, int tipChosen) {
  if (bill.isEmpty) {
    return 0.00;
  } else {
    double billAmount = double.parse(bill);
    return billAmount * (tipChosen / 100);
  }
}

void updateBill(String button, String currentBill, int tipChosen, Function(String) updateBillCallback) {
  if (button == 'DEL') {
    if (currentBill.isNotEmpty) {
      updateBillCallback(currentBill.substring(0, currentBill.length - 1));
    }
  } else if (button == '.') {
    if (!currentBill.contains('.')) {
      updateBillCallback(currentBill + button);
    }
  } else {
    if (currentBill.contains('.') && currentBill.split('.')[1].length >= 2) {
      updateBillCallback(button);
    } else {
      updateBillCallback(currentBill + button);
    }
  }
}
