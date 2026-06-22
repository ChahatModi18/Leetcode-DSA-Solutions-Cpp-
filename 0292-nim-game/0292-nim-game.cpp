class Solution {//greedy approach , as per observed pattern 
public:
    bool canWinNim(int n) {
         if (n % 4 != 0)
            return true;
        else
            return false;
    }
};