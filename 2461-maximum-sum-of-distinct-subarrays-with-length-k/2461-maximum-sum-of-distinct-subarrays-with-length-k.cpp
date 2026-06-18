class Solution {
public:
    long long maximumSubarraySum(vector<int>& nums, int k) {

        unordered_map<int, int> freq;

        long long windowSum = 0;
        long long maxSum = 0;

        int left = 0;

        for (int right = 0; right < nums.size(); right++) {

            // Add current element
            windowSum += nums[right];
            freq[nums[right]]++;

            // Keep window size exactly k
            if (right - left + 1 > k) {

                windowSum -= nums[left];

                freq[nums[left]]--;

                if (freq[nums[left]] == 0) {
                    freq.erase(nums[left]);
                }

                left++;
            }

            // Valid window of size k with all distinct elements
            if (right - left + 1 == k && freq.size() == k) {
                maxSum = max(maxSum, windowSum);
            }
        }

        return maxSum;
    }
};