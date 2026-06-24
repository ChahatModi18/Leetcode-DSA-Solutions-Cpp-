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
    vector<int> inorderTraversal(TreeNode* root) {

        vector<int> result;

        inorder(root, result);

        return result;
    }

private:

    void inorder(TreeNode* node, vector<int>& result) {

        // Base Case: if node is NULL, stop recursion
        if (!node)
            return;

        inorder(node->left, result);     // 1. Visit Left Subtree

        result.push_back(node->val);     // 2. Visit Root

        inorder(node->right, result);    // 3. Visit Right Subtree
    }
};