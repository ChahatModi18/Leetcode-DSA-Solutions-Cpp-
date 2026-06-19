class Solution {
public:

    // Function to count how many elements in the matrix
    // are less than or equal to target
    int countElements(vector<vector<int>> &matrix, int target) {

        int n = matrix.size();

        int count = 0;

        // Start from bottom-left corner
        int row = n - 1;
        int col = 0;

        // Traverse until we go outside the matrix
        while (row >= 0 && col < n) {

            // If current element is <= target
            if (matrix[row][col] <= target) {

                // All elements above this element in the same column
                // will also be <= target because the column is sorted
                count += (row + 1);

                // Move to next column
                col++;
            }
            else {

                // Current element is greater than target
                // Move upward to find smaller elements
                row--;
            }
        }

        return count;
    }

    int kthSmallest(vector<vector<int>>& matrix, int k) {

        int n = matrix.size();

        // Smallest possible value in matrix
        int low = matrix[0][0];

        // Largest possible value in matrix
        int high = matrix[n - 1][n - 1];

        int ans = 0;

        // Binary search on the value range
        while (low <= high) {

            int mid = low + (high - low) / 2;

            // Count elements <= mid
            int count = countElements(matrix, mid);

            // If count is at least k,
            // mid can be the answer
            if (count >= k) {

                ans = mid;

                // Try to find a smaller valid answer
                high = mid - 1;
            }
            else {

                // Not enough elements <= mid
                // Need a larger value
                low = mid + 1;
            }
        }

        return ans;
    }
};