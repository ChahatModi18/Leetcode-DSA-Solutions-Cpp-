class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int maxCur = 0;    // Maximum profit ending at current day
        int maxSoFar = 0;  // Maximum profit found so far

        for (int i = 1; i < prices.size(); i++) {

            // Add today's price difference to current profit.
            // If it becomes negative, reset to 0 (start a new subarray).
            maxCur = max(0, maxCur + (prices[i] - prices[i - 1]));

            // Update the maximum profit obtained so far.
            maxSoFar = max(maxSoFar, maxCur);
        }

        return maxSoFar;
    }
};