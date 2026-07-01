class Solution {
public:
    int countDigits(int num) { //num stores the original number
        int n = num; //extracts digits one by one 
        int ans = 0;

        while (n) {
            if (num % (n % 10) == 0)
               ans++;   
            n /= 10;
        }

        return ans;
    }
};