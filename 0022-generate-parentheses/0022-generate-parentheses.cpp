class Solution {
public:

    // Recursive function to generate valid parentheses
    void generate(vector<string> &ans, string str, int open, int close, int n) {

        // Base Case:
        // If we have used all n opening and n closing brackets,
        // then the current string is a valid answer.
        if (n == open && n == close) {
            ans.push_back(str);
            return;
        }

        // We can add a closing bracket ')' only if
        // the number of opening brackets used is greater
        // than the number of closing brackets used.
        // This ensures the sequence remains valid.
        if (open > close)
            generate(ans, str + ")", open, close + 1, n);

        // We can add an opening bracket '('
        // as long as we have not used all n opening brackets.
        if (open < n)
            generate(ans, str + "(", open + 1, close, n);
    }

    vector<string> generateParenthesis(int n) {

        // Stores all valid parenthesis combinations
        vector<string> ans;

        // Start recursion with:
        // empty string
        // 0 opening brackets used
        // 0 closing brackets used
        generate(ans, "", 0, 0, n);

        return ans;
    }
};