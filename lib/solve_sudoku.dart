bool solveSudoku(List<List<int>> grid) {
  // Find the next empty cell (indicated by a 0 in the grid)
  int row = -1, col = -1;
  bool isEmpty = false;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (grid[i][j] == 0) {
        row = i;
        col = j;
        isEmpty = true;
        break;
      }
    }
    if (isEmpty) {
      break;
    }
  }

  // If there are no empty cells, then the Sudoku is solved
  if (!isEmpty) {
    return true;
  }

  // Try all possible values for the empty cell
  for (int num = 1; num <= 9; num++) {
    if (isSafe(grid, row, col, num)) {
      // If the number is safe to put in the cell, then put it there and recurs
      grid[row][col] = num;
      if (solveSudoku(grid)) {
        // If the Sudoku is solved, then return true
        return true;
      } else {
        // If the Sudoku is not solved, then backtrack and try another number
        grid[row][col] = 0;
      }
    }
  }
  return false;
}

// This function checks if it is safe to put a number in a cell
bool isSafe(List<List<int>> grid, int row, int col, int num) {
  // Check if the number is already present in the row
  for (int d = 0; d < grid[row].length; d++) {
    if (grid[row][d] == num) {
      return false;
    }
  }

  // Check if the number is already present in the column
  for (int r = 0; r < grid.length; r++) {
    if (grid[r][col] == num) {
      return false;
    }
  }

  // Check if the number is already present in the 3x3 subgrid
  int sqrt = 3;
  int boxRowStart = row - row % sqrt;
  int boxColStart = col - col % sqrt;
  for (int r = boxRowStart; r < boxRowStart + sqrt; r++) {
    for (int d = boxColStart; d < boxColStart + sqrt; d++) {
      if (grid[r][d] == num) {
        return false;
      }
    }
  }

  // If the number is not present in the row, column, or 3x3 subgrid, then it is safe to put it in the cell
  return true;
}
