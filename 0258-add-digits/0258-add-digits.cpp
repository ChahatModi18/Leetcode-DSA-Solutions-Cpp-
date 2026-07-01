class Solution { // ITERATION 
public:
    int addDigits(int num) {
        int sum=0;
        while(num>=10){ //The outer while loop checks whether the number has more than one digit (num >= 10).
            while(num>0){ //The inner while loop extracts every digit and adds it to sum
            sum+=(num%10);  //extracts last digit
            num/=10; //removes last digit 
        }
        num=sum; //After one complete pass, num = sum  : sum = 0 /:Repeat until num is a single digit.
        sum=0;
        }
        return num;
    }
};