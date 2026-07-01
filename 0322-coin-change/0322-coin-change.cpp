class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        // dp[i] = Minimum number of coins required to make amount i
        // Initialize every value with amount + 1 (acts as infinity/impossible)
        vector<int> dp(amount + 1, amount + 1);

        // Base case:
        // 0 coins are needed to make amount 0
        dp[0] = 0;

        // Calculate answer for every amount from 1 to amount
        for (int i = 1; i <= amount; i++) {
            // Try every available coin
            for (int coin : coins) {

                // Check if this coin can contribute to current amount i
                if (coin <= i) {

                    // Option 1: Keep the previous minimum value
                    // Option 2: Use this coin once
                    //          = dp[i - coin] + 1
                    // Take the minimum of both
                    dp[i] = min(dp[i], dp[i - coin] + 1);
                }
            }
        }

        // If dp[amount] was never updated,
        // then it is impossible to make the amount
        if (dp[amount] == amount + 1)
            return -1;

        // Return the minimum number of coins needed
        return dp[amount];
    }
};