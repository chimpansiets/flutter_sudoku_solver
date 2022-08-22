import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/providers/sudoku_provider.dart';

class InputNumber extends StatelessWidget {
  final int number;

  const InputNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.yellow,
      onTap: () {
        Provider.of<SudokuProvider>(context, listen: false)
            .changeIndexTo(number);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        child: Text(number.toString()),
      ),
    );
  }
}

class SudokuInput extends StatefulWidget {
  const SudokuInput({Key? key}) : super(key: key);

  @override
  State<SudokuInput> createState() => _SudokuInputState();
}

class _SudokuInputState extends State<SudokuInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => InputNumber(
          number: index,
        ),
      ),
    );
  }
}
