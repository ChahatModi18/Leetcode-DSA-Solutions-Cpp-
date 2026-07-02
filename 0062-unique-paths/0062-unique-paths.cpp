//2D DP  : NO CERTAIN PATTERN FIGURED OUT 
//TO DO SUCH QUESTIONS,, USE : RECURSIVE APPROACH 
//STEP 1,. assume : answer is on f(r,c ) ie : no of ways to reach that cell from start 
// f(r-1,c) or f(r,c-1)  //coordinates to reach to assumed at finish point 
// total no of paths = f(r-1,c) + f(r,c-1) : 
//RECURSIVE RELATION TO DP: F-> DP RELACE
// r -> i
// c-> j
// dp(i,j)
//1st cell -> default answer not zero because not outside grid : at 1st path on grid so, not zero
// default answer = 1
// atleast 1 way to land on any cell 

class Solution { 
public:
    int uniquePaths(int m, int n) {
        vector<vector<int>> dp(m, vector<int>(n,1));   //default value 1 set 

        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(i-1 < 0 || j-1 < 0){
                    dp[i][j] =1;
                }
                else{
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]; //RECURSIVE FORMULA 
                }
            }
        }
       return dp[m-1][n-1]; 
    }
};