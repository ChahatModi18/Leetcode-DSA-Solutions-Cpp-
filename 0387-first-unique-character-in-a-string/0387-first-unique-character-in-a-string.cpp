class Solution {
public:
    int firstUniqChar(string s) {
        vector<int> count(26,0);  //an array of size 26 (for letters a to z).
        for (char c: s){ //range-based for loop.
        // This loop ount how many times each letter appears.
        //Take each character of the string s one by one and store it in the variable c
            count[c - 'a']++; //stores the frequency of the letter(97-97) & increases the frequency of char by 1
                             // after calculation coverts character into index , initially count is 0
        }
        for(int i=0;i<s.length();i++){ //This loop goes through the string using the index.
        //This preserves the original order of the string.
            if (count[s[i]-'a']==1){ //Has the current character appeared exactly one time in the whole string?"
                return i;
            
            }
        }
        return -1;
    }
};