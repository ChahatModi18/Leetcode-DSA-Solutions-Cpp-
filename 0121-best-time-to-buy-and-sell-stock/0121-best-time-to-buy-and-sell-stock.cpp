class Solution { //dp solution 
public:

    int maxProfit(vector<int>& a) {
        int ans=0;
        int n=a.size();
        vector<int>pM(n);
        pM[0]=a[0];

        for(int i=1;i<n;i++){
            pM[i]=min(a[i],pM[i-1]);
            ans=max(ans,a[i]-pM[i]);
        }

        return ans;
    }
};