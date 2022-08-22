import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/providers/sudoku_provider.dart';

class SudokuCell extends StatefulWidget {
  final int index;
  final int value;
  final bool selected;

  const SudokuCell(this.index,
      {Key? key, required this.value, required this.selected})
      : super(key: key);

  @override
  State<SudokuCell> createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SudokuProvider>(context, listen: false)
            .changeSelectedTo(widget.index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.selected ? Colors.green : Colors.white,
          border: Border.all(
            color: Colors.black87,
            width: 2,
          ),
        ),
        height: 10,
        width: 10,
        alignment: Alignment.center,
        child: Text(widget.value.toString()),
      ),
    );
  }
}
