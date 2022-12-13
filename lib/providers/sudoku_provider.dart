import 'dart:math';

import 'package:flutter/material.dart';

class SudokuProvider extends ChangeNotifier {
  // List<int> sudokuBoard = List.filled(9 * 9, 0);
  List<int> sudokuBoard = [
    0,
    0,
    0,
    2,
    6,
    0,
    7,
    0,
    1,
    6,
    8,
    0,
    0,
    7,
    0,
    0,
    9,
    0,
    1,
    9,
    0,
    0,
    0,
    4,
    5,
    0,
    0,
    8,
    2,
    0,
    1,
    0,
    0,
    0,
    4,
    0,
    0,
    0,
    4,
    6,
    0,
    2,
    9,
    0,
    0,
    0,
    5,
    0,
    0,
    0,
    3,
    0,
    2,
    8,
    0,
    0,
    9,
    3,
    0,
    0,
    0,
    7,
    4,
    0,
    4,
    0,
    0,
    5,
    0,
    0,
    3,
    6,
    7,
    0,
    3,
    0,
    1,
    8,
    0,
    0,
    0
  ];

  late int n;

  SudokuProvider({Key? key}) {
    n = sqrt(sudokuBoard.length).toInt();
  }

  changeIndexTo(int index, int toValue) {
    sudokuBoard[index] = toValue;
  }

  bool _rowIsValid(int index) {
    int numberPlaced = sudokuBoard[index];

    int rowStart = (index ~/ 9) * 9;

    for (int i = 0; i < 9; i++) {
      int numberIndex = rowStart + i;
      int number = sudokuBoard[numberIndex];

      if (number == numberPlaced && numberIndex != index) {
        return false;
      }
    }

    return true;
  }

  bool _colIsValid(int index) {
    int numberPlaced = sudokuBoard[index];

    int colStart = index % 9;

    for (int i = 0; i < 9; i++) {
      int numberIndex = colStart + (9 * i);
      int number = sudokuBoard[numberIndex];

      if (number == numberPlaced && numberIndex != index) {
        return false;
      }
    }

    // If the function reaches this point, it means that no duplicate numbers
    // were found in the column, so it is valid and we return true.
    return true;
  }

  // Checks if the number placed at index is valid in the 3x3 box
  bool _boxIsValid(int index) {
    int numberPlaced = sudokuBoard[index];

    int boxStart = (index ~/ 27) * 27 + (index % 9 ~/ 3) * 3;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int numberIndex = boxStart + (9 * i) + j;
        int number = sudokuBoard[numberIndex];

        if (number == numberPlaced && numberIndex != index) {
          return false;
        }
      }
    }

    return true;
  }

  bool _isValid(int index) {
    return _rowIsValid(index) && _colIsValid(index) && _boxIsValid(index);
  }

  Future<bool> solve(int currIndex) async {
    if (currIndex == (9 * 9)) {
      return true;
    } else if (sudokuBoard[currIndex] > 0) {
      return await solve(currIndex + 1);
    }

    for (var i = 1; i <= 9; i++) {
      sudokuBoard[currIndex] = i;

      if (_isValid(currIndex)) {
        if (await solve(currIndex + 1)) {
          return true;
        }
      }

      sudokuBoard[currIndex] = 0;
    }

    return false;
  }
}
