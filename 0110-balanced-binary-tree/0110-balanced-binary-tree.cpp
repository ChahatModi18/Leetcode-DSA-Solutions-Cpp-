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

    bool isBalanced(TreeNode* root) {

        // If dfsHeight() returns -1,
        // it means the tree is NOT balanced.
        // Otherwise, it returns the actual height.
        return dfsHeight(root) != -1;
    }

private:

    int dfsHeight(TreeNode* node) {

        // Base Case:
        // Height of an empty tree is 0.
        if (!node)
            return 0;

        // Find height of the left subtree.
        int leftHeight = dfsHeight(node->left);

        // If left subtree is already unbalanced,
        // no need to check anything else.
        // Immediately return -1.
        if (leftHeight == -1)
            return -1;

        // Find height of the right subtree.
        int rightHeight = dfsHeight(node->right);

        // If right subtree is already unbalanced,
        // immediately return -1.
        if (rightHeight == -1)
            return -1;

        // Check the balance condition for the current node.
        // Difference between left and right heights
        // should not exceed 1.
        if (abs(leftHeight - rightHeight) > 1)
            return -1;

        // Current node is balanced.
        // Return its height.
        // Height = 1 (current node)
        //        + maximum of left and right subtree heights.
        return 1 + max(leftHeight, rightHeight);
    }
};