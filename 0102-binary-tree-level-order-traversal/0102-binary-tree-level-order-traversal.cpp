/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {} //default constructor
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {} //parameterized constructor 
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    vector<vector<int>> levelOrder(TreeNode* root) { //levelOrder is the function
        //vector<vector<int>> : is used to write the return type of the function 
        vector<vector<int>>ans; // a vector ans storing vectors for each level 
        if(root==NULL) return ans; 
        queue<TreeNode*>q;// queue syntax 
        q.push(root);  //root is always pushed while level order traversal

        while(!q.empty()){
            int s=q.size(); //all elements in 1st queue, size : at a level max, no of nodes  , since at each level, elemnts are added and while going to next level,pop is done . so each queue will have thw no of elements as current level 
            vector<int> v; //new vector created for storing level nodes 
            for(int i=0;i<s;i++){ // s= size of current level 
                TreeNode *node=q.front(); //front stored in node , pop 
                q.pop(); // pop from front 

                if(node->left!=NULL) q.push(node->left); // store until left is null,push 
                if(node->right!=NULL) q.push(node->right); //store until right is null, push 
                v.push_back(node->val); //root named array is present in val , which is then traversed and given to vector v by pushing back  
            }
            ans.push_back(v); //push v (current elements ) in ans : until last level 
        }
        return ans;
    }
};