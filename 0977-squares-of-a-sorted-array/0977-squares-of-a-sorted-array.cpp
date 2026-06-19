class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        int n = nums.size();
        int s=0;  // Left pointer (start of sorted array)
        int e=n-1;  // Right pointer (end of sorted array)
// Result vector of size n to store squares in sorted order
        vector<int>ans (n);

// Fill answer array from right to left because the largest square should be placed at the end first
        for(int i=n-1;i>=0;i--){

     // Compare absolute values at both ends. The larger absolute value will produce the larger square
            if (abs(nums[s])>=abs(nums[e])){

                ans[i]=nums[s]*nums[s];// Left element has larger (or equal) magnitude,so place its square at current position
                s++;
            }else{
                ans[i]=nums[e]*nums[e];// Right element has larger magnitude,so place its square at current position
                e--;// Move right pointer to the previous element
            }
            
        }
        return ans;
    }
};

//the hidden assumption is:"The input array is already sorted."
//2 pointer approach 