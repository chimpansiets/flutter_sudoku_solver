import 'package:flutter/material.dart';
import 'package:sudoku_solver/solve_sudoku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Solver',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.yellow,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
      ),
      home: SudokuSolver(),
    );
  }
}

class SudokuSolver extends StatelessWidget {
  SudokuSolver({Key? key}) : super(key: key);

  onSolvePressed() {
    // First, we need to convert the grid of TextEditingControllers into a 2D array of integers
    var grid = List.generate(
      9,
      (i) => List.generate(9, (j) => int.tryParse(controllers[i][j].text) ?? 0),
    );
    // Next, we can call the `solveSudoku` function to solve the grid
    if (solveSudoku(grid)) {
      // If the function returns true, then the Sudoku has been successfully solved
      // We can now update the TextEditingControllers with the solution
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
          controllers[i][j].text = grid[i][j].toString();
        }
      }
    } else {
      // If the function returns false, then the Sudoku could not be solved
      // This could happen if the grid is invalid or has multiple solutions
      // You can handle this case however you want (e.g. show an error message)
    }
  }

  // Create a 9x9 grid of TextEditingController objects
  List<List<TextEditingController>> controllers = List.generate(
    9,
    (i) => List.generate(
      9,
      (j) => TextEditingController(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sietse\'s ugly Sudoku Solver tool'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Create a 9x9 grid of TextField widgets,
          // each with its own TextEditingController
          for (int i = 0; i < 9; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 9; j++)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Use white as the background color
                      border: Border.all(
                        color: Colors.black, // Use black as the border color
                        width: 1, // Use a thin border
                      ),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    width: 35,
                    height: 35,
                    child: TextField(
                      controller: controllers[i][j],
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
              ],
            ),
          // Create a button to trigger the Sudoku solving
          ElevatedButton(
            onPressed: onSolvePressed,
            child: const Text('Solve'),
          )
        ],
      ),
    );
  }
}
