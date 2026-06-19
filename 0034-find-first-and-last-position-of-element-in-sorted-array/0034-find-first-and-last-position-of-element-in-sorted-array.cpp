class Solution {
public:

    // Find first occurrence and last occurrence of target
    // in a sorted array using Binary Search
    vector<int> searchRange(vector<int>& nums, int target) {

        // Result vector:
        // res[0] = first occurrence
        // res[1] = last occurrence
        vector<int> res(2, -1);

        int left = 0;
        int right = nums.size() - 1;
        int idx = -1;

        // FIND FIRST OCCURRENCE

        while (left <= right) {

            // Find middle index
            int mid = left + (right - left) / 2;

            if (nums[mid] == target) {

                // Target found
                idx = mid;

                // Continue searching on left side
                // for an earlier occurrence
                right = mid - 1;
            }
            else if (nums[mid] > target) {

                // Search in left half
                right = mid - 1;
            }
            else {

                // Search in right half
                left = mid + 1;
            }
        }

        // Store first occurrence
        res[0] = idx;

        // FIND LAST OCCURRENCE

        // Reset search boundaries
        left = 0;
        right = nums.size() - 1;
        idx = -1;

        while (left <= right) {

            // Find middle index
            int mid = left + (right - left) / 2;

            if (nums[mid] == target) {

                // Target found
                idx = mid;

                // Continue searching on right side
                // for a later occurrence
                left = mid + 1;
            }
            else if (nums[mid] > target) {

                // Search in left half
                right = mid - 1;
            }
            else {

                // Search in right half
                left = mid + 1;
            }
        }

        // Store last occurrence
        res[1] = idx;

        // Return [first occurrence, last occurrence]
        return res;
    }
};