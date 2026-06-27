/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right)
 *         : val(x), left(left), right(right) {}
 * };
 */

class Solution {
public:

    bool Symmetric(TreeNode* left, TreeNode* right)
    {
        // Base cases
        if(left == NULL && right == NULL)
            return true;

        if(left == NULL || right == NULL)
            return false;

        // Root values should be equal
        if(left->val != right->val)
            return false;

        // -------------------------------
        // Your existing conditions
        // -------------------------------

        // Compare left->right with right->left
        if(left->right != NULL && right->left != NULL)
        {
            if(left->right->val != right->left->val)
                return false;
        }
        else if(left->right != right->left)
        {
            // One NULL and the other not NULL
            return false;
        }

        // Compare left->left with right->right
        if(left->left != NULL && right->right != NULL)
        {
            if(left->left->val != right->right->val)
                return false;
        }
        else if(left->left != right->right)
        {
            return false;
        }
 //error in previous code : to check deeper levels 
        return Symmetric(left->left, right->right) &&
               Symmetric(left->right, right->left);
    }

    bool isSymmetric(TreeNode* root)
    {
        if(root == NULL)
            return true;

        return Symmetric(root->left, root->right);
    }
};