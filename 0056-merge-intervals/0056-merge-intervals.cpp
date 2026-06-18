class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {

        sort(intervals.begin(), intervals.end());

        vector<vector<int>> answer;

        answer.push_back(intervals[0]);

        for (int i = 1; i < intervals.size(); i++) {

            int start = intervals[i][0];
            int end = intervals[i][1];

            int lastMergedEnd = answer.back()[1];

            // Overlapping intervals
            if (start <= lastMergedEnd) {

                answer.back()[1] =
                    max(answer.back()[1], end);
            }

            // Non-overlapping intervals
            else {
                answer.push_back(intervals[i]);
            }
        }

        return answer;
    }
};