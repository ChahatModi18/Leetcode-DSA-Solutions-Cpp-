class Solution {
public:

    void solve(string& s, int& k,int index){
        // base case
        if(index >= s.size()){
            return;
        }

        int start = index;
        int end = min(index+k-1,(int)s.size()-1);
        while(start < end){
            swap(s[start++],s[end--]);
        }
        solve(s,k,index + (2*k));
    }

    string reverseStr(string s, int k) {
        int index = 0;
        solve(s,k,index);
        return s;
    }
};