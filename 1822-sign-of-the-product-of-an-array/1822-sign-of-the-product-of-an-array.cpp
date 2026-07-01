class Solution {
public:
    int arraySign(vector<int>& nums) {
        int cnt = 0; //this will basically count the negatives in the array
        for(int x : nums){
            if(x==0) return 0; //because if one zero is present in the array then whole product will be zero so return zero
            if(x<0) cnt ++; //count the negatives
        }
        return (cnt%2 == 0) ? 1 : -1; //if the count of the negative numbers is even , then they will product to an even number eventually but if the count of the negative number is odd , then they will stay negative
    }
};