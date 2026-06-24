class Solution {
public:
    // Function to calculate how many days are needed, if ship capacity is "capacity"
     int returnDays(vector<int>& weights, int capacity) {

        int days = 1;      // start with Day 1
        int load = 0;      // current ship load

        for(int weight : weights) {

            // If adding current package exceeds capacity,
            // send current ship and start a new day
            if(load + weight > capacity) {
                days++;
                load = weight;
            }
            else {
                load += weight;
            }
        }

        return days;
    }

    int shipWithinDays(vector<int>& weights, int days) {

    //sorted array in increasing order 
    //binary search pattern: find optimal answer
    //optimization algorithm 
    //ship size depends on no of days not on weight of ship 

            // Minimum capacity must be at least the heaviest package
        int mx = *max_element(weights.begin(), weights.end()); //max array= starting point 

        // Maximum capacity can be sum of all packages
        int sum = accumulate(weights.begin(), weights.end(), 0); //sum array= ending point 

        int low = mx;
        int high = sum;


        // Binary Search on Answer
        while(low <= high){
            int mid = low+(high-low)/2;

            int requiredDays = returnDays(weights, mid); //standard template for binary search  : // a function needs to be defined in some qns in binary search


        // Capacity works, try smaller capacity
        if (requiredDays <= days){
             high=mid-1;
        }
        else{
            low=mid+1; // if no of adays is more , going right side 
        }
        }
        //Smallest valid capacity
        return low; 
    }
};