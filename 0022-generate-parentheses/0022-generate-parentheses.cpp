class Solution {
public:

    // Stores all valid parenthesis combinations
    vector<string> result;

    // Recursive backtracking function
    void back(string& curr, int open, int close, int n) {

        // Base Case:
        // When the string length becomes 2*n,
        // we have used all parentheses.
        if (curr.length() == 2 * n) {
            result.push_back(curr);   // Store the valid combination
            return;
        }

        // Choice 1: Add an opening bracket '('
        // We can add it only if we have not used n opening brackets yet.
        if (open < n) {
            curr.push_back('(');          // Choose
            back(curr, open + 1, close, n); // Explore
            curr.pop_back();             // Undo choice (Backtrack)
            //using pop to remove last char in string using STL
        }

        // Choice 2: Add a closing bracket ')'
        // We can add it only when there are more opening
        // brackets than closing brackets.
        if (close < open) {
            curr.push_back(')');         // Choose
            back(curr, open, close + 1, n); // Explore
            curr.pop_back();            // Undo choice (Backtrack)
        }
    }

    vector<string> generateParenthesis(int n) {

        string curr = "";   // Current parenthesis string being built
        // Start recursion with 0 open and 0 close brackets used
        back(curr, 0, 0, n);

        return result;
    }
};