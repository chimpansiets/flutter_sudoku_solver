import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SudokuProvider extends ChangeNotifier {
  List<int> sudokuBoard = List.filled(9 * 9, 0);
  late int n;
  int selectedIndex = 0;

  SudokuProvider({Key? key}) {
    n = sqrt(sudokuBoard.length).toInt();
  }

  changeIndexTo(int toValue) {
    sudokuBoard[selectedIndex] = toValue;
    notifyListeners();
  }

  changeSelectedTo(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  solve() {
    // TODO: Add the solve sudoku logic here
  }
}
