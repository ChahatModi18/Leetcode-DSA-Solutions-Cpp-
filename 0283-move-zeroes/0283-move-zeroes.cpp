class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = 0 ; //A variable that points to or tracks a position/index in the array.
        for ( int i=0;i<nums.size();i++){
            if (nums[i]!=0){
                //swap the current element with the element at the index j 
                swap(nums[i],nums[j]);
                j++; // move j to the next index for placing non zero element 
            }
        }
    }
};
/*1. j is used to track the position to place the next non-zero element.
2. The loop goes through each element i:
3. If nums[i] is non-zero, it swaps nums[i] with nums[j], and increments j.
*/

/*Function Parameter
void moveZeroes(vector<int>& nums)
vector<int>& nums
vector<int> means a dynamic array of integers.
nums is the name of the vector.
& means reference.
Why use & ?
Without &:
void moveZeroes(vector<int> nums)
A copy of the entire vector would be created.
Example:
nums = [0,1,0,3,12]
A new vector would be made and modifications would affect only the copy.
With &:
void moveZeroes(vector<int>& nums)
No copy is created.
The function directly works on the original vector, so changes remain after the function ends*/
