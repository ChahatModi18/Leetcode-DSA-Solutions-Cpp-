class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {

    double ans=0;
    double sum=0;
    int s = 0;

    //first window processing 
    for(int i=0;i<k;i++){
        sum+=nums[i];
        }

        int e = k;
        ans = sum/k;
        double avg=0;

        while(e < nums.size()){
            sum = sum - nums[s] + nums[e];
            avg = sum/k;
            ans=max(ans,avg);
            s++;
            e++;

    }
    return ans;
    }
};