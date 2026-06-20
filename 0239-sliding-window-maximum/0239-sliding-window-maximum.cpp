class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        int n = nums.size();

        vector<int> left(n), right(n);

        // Build left array
        for (int i = 0; i < n; i++) {
            if (i % k == 0)
                left[i] = nums[i];
            else
                left[i] = max(left[i - 1], nums[i]);
        }

        // Build right array
        for (int i = n - 1; i >= 0; i--) {
            if (i == n - 1 || (i + 1) % k == 0)
                right[i] = nums[i];
            else
                right[i] = max(right[i + 1], nums[i]);
        }

        vector<int> ans;

        for (int i = 0; i <= n - k; i++) {
            ans.push_back(max(right[i], left[i + k - 1]));
        }

        return ans;
    }
};