class Solution {
public:
    int search(vector<int>& nums, int target) {

        int low = 0;                  // start index
        int high = nums.size() - 1;  // end index

        while(low <= high) {         // binary search loop

            int mid = low + (high - low) / 2; // middle index

            if(nums[mid] == target) { // target found
                return mid;
            }

            // check if left half is sorted
            if(nums[low] <= nums[mid]) {

                // target lies in left sorted half
                if(nums[low] <= target && target < nums[mid]) {
                    high = mid - 1;  // search left
                }
                else {
                    low = mid + 1;   // search right
                }
            }

            // right half is sorted
            else {

                // target lies in right sorted half
                if(nums[mid] < target && target <= nums[high]) {
                    low = mid + 1;   // search right
                }
                else {
                    high = mid - 1;  // search left
                }
            }
        }

        return -1; // target not found
    }
};