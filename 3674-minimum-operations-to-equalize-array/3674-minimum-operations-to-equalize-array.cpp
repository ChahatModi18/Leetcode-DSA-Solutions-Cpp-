class Solution { //sliding window variable size

public:
    int minOperations(vector<int>& nums) {
        int n=nums[0];
        for(int i=0;i<nums.size();i++){
            if(nums[i]!=n){
                return 1;
            }

        }
        return 0;
    }
};