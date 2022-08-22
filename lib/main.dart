import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/components/sudoku_board.dart';
import 'package:sudoku_solver/components/sudoku_input.dart';
import 'package:sudoku_solver/providers/sudoku_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sudoku Solver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SudokuProvider>(
      create: (context) => SudokuProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Consumer<SudokuProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SudokuBoard(board: value.sudokuBoard),
                const SudokuInput(),
                TextButton(
                  onPressed: () {
                    SudokuProvider sudokuProvider =
                        Provider.of<SudokuProvider>(context, listen: false);

                    // sudokuProvider.solve()
                  },
                  child: const Text("Start Solving Magic"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
