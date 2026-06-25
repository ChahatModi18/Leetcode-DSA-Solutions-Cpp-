class Solution {
public:
    int longestMountain(vector<int>& arr) {

        int n = arr.size();

        if (n < 3) {
            return 0;
        }

        vector<int> up(n, 0);
        vector<int> down(n, 0);

        // Prefix pass
        for (int i = 1; i < n; i++) {
            if (arr[i] > arr[i - 1]) {
                up[i] = up[i - 1] + 1;
            }
        }

        // Suffix pass
        for (int i = n - 2; i >= 0; i--) {
            if (arr[i] > arr[i + 1]) {
                down[i] = down[i + 1] + 1;
            }
        }

        int ans = 0;

        // Check every possible peak
        for (int i = 1; i < n - 1; i++) {

            if (up[i] > 0 && down[i] > 0) {

                ans = max(ans,
                          up[i] + down[i] + 1);
            }
        }

        return ans;
    }
};