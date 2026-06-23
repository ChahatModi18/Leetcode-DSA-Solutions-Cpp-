class Solution {
public:

    // Stores all valid N-Queens configurations
    vector<vector<string>> res;

    vector<vector<string>> solveNQueens(int n) {

        // Create an empty n x n chessboard filled with '.'
        vector<string> board(n, string(n, '.'));

        // Start placing queens from row 0
        backtrack(board, 0);

        return res;
    }

    // Recursive function to place queens row by row
    void backtrack(vector<string>& board, int row) {

        // Base Case:
        // If all rows are processed, one valid arrangement is found
        if (row == board.size()) {
            res.push_back(board);
            return;
        }

        // Try placing a queen in every column of current row
        for (int col = 0; col < board.size(); col++) {

            // Check if current position is safe
            if (isSafe(board, row, col)) {

                // Place Queen
                board[row][col] = 'Q';

                // Move to next row
                backtrack(board, row + 1);

                // Backtrack:
                // Remove queen and try next column
                board[row][col] = '.';
            }
        }
    }

    // Checks whether queen can be placed at (row,col)
    bool isSafe(vector<string>& board, int row, int col) {

        // Check same column above current row
        for (int i = 0; i < row; i++) {
            if (board[i][col] == 'Q')
                return false;
        }

        // Check upper-left diagonal
        for (int i = 1; i <= min(row, col); i++) {
            if (board[row - i][col - i] == 'Q')
                return false;
        }

        // Check upper-right diagonal
        for (int i = 1; i <= min(row, (int)board.size() - 1 - col); i++) {
            if (board[row - i][col + i] == 'Q')
                return false;
        }

        // Safe position found
        return true;
    }
};