class Solution { //optimal sliding window 
public:
    int minSubArrayLen(int target, vector<int>& nums) {

        int left=0;  //template line 

        int minLength = INT_MAX, currentSum=0, length=0; //currentsum means current windoe sum 
        //template line :
        for( int right=0; right < nums.size(); right++){

            currentSum+=nums[right];

            while(currentSum >= target){ //ACOORDING TO DEMAND OF QN AND CONDITION , ONLY INSIDE WHILE : QNS 
                length = right-left+1;
                minLength = min(length, minLength);
                currentSum -= nums[left];

                left++;

            }
        }
        return(minLength == INT_MAX) ? 0 : minLength;
    }
};