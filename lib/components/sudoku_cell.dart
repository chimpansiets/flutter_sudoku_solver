import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/providers/sudoku_provider.dart';

class SudokuCell extends StatefulWidget {
  final int index;
  final int value;

  const SudokuCell(this.index, {Key? key, required this.value})
      : super(key: key);

  @override
  State<SudokuCell> createState() => _SudokuCellState();
}

class _SudokuCellState extends State<SudokuCell> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.value == 0 ? '' : widget.value.toString(),
      ),
      onChanged: (value) {
        Provider.of<SudokuProvider>(context, listen: false)
            .changeIndexTo(widget.index, int.parse(value));
      },
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
