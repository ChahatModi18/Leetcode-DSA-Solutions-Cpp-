class Solution {
public:
    int tribonacci(int n) {
         if (n == 0) return 0;
        if (n == 1 || n == 2) return 1;

        vector<int> dp(n+1);
       /*stack overflow runtime error  if(n==0||n==1)
            return n;
        return tribonacci(n+1)+tribonacci(n+2)+tribonacci(n+3);*/
        //base condition 
        dp[0]=0;
        dp[1]=1;
        dp[2]=1;
        for(int i=3;i<=n;i++){
            dp[i]=dp[i-1]+dp[i-2]+dp[i-3];
        }
        return dp[n];
    }
};