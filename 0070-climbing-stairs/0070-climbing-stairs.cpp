//fibonaccii series 
class Solution {// irregular jumping ecursion since it's unknown when 1 or 2 stairs to climb 
public:
    int climbStairs(int n) {
        if(n<=2) return n;
        vector<int> dp(n+1);

        dp[0] = 0;
        dp[1] = 1;
        dp[2]=2;
        for(int i=3;i<n+1;i++){
            dp[i] = dp[i-1] + dp[i-2];
        }

        return dp[n];
    }
};