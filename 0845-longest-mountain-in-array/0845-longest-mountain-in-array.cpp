class Solution { //2 pointers approach
public:
    int longestMountain(vector<int>& arr) {

        int n = arr.size();

        if (n < 3) {
            return 0;
        }

        int maximumlen = 0;

        for (int i = 1; i < n - 1; i++) {

            // Peak found
            if (arr[i] > arr[i - 1] && arr[i] > arr[i + 1]) {

                int left = i - 1;
                int right = i + 1;

                while (left > 0 && arr[left] > arr[left - 1]) {
                    left--;
                }
                while (right < n - 1 && arr[right] > arr[right + 1]) {
                    right++;
                }
                maximumlen = max(maximumlen, right - left + 1);

                i = right; //skips processed elements
            }
        }

        return maximumlen;
    }
};