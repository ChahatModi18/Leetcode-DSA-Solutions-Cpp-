class Solution {
public:
    int findPeakElement(vector<int>& nums) {

        int n = nums.size();          // Store size of array

        int low = 0;                  // Start of search range
        int high = nums.size() - 1;   // End of search range

        // Continue until search space reduces to one element
        while (low < high) {

            // Find middle index safely
            int mid = (low + high) >> 1;

            // Check if we are on a descending slope
            // Peak lies at mid or on the left side
            if (nums[mid] > nums[mid + 1]) {
                high = mid;
            }
            else {
                // We are on an ascending slope
                // Peak lies on the right side
                low = mid + 1;
            }
        }

        // low == high, pointing to a peak element
        return low;
    }
};