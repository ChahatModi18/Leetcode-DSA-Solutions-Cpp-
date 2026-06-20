class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {

        int n = nums.size();

        // Sum of first window
        long long sum = 0;
        for(int i = 0; i < k; i++) {
            sum += nums[i];
        }

        long long maxSum = sum;

        // Slide the window
        for(int i = k; i < n; i++) {
            /*  sum = current_window_sum - outgoing_element + incoming_element;  */
            sum = sum - nums[i - k] + nums[i]; //When i points to the new incoming element, the element leaving the window is exactly k positions
            maxSum = max(maxSum, sum);
        }

        return (double)maxSum / k;
    }
};