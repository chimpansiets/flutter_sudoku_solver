import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/components/sudoku_cell.dart';
import 'package:sudoku_solver/providers/sudoku_provider.dart';

class SudokuBoard extends StatefulWidget {
  final List<int> board;

  const SudokuBoard({Key? key, required this.board}) : super(key: key);

  @override
  State<SudokuBoard> createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  @override
  Widget build(BuildContext context) {
    SudokuProvider sudokuProvider =
        Provider.of<SudokuProvider>(context, listen: false);

    return Container(
      height: 400,
      width: 400,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 9 * 9,
        itemBuilder: (context, index) {
          return SudokuCell(
            index,
            value: sudokuProvider.sudokuBoard[index],
            selected: index == sudokuProvider.selectedIndex ? true : false,
          );
        },
      ),
    );
  }
}
