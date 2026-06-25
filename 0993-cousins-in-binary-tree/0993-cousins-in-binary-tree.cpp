/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    bool isCousins(TreeNode* root, int x, int y) {

        if (root == NULL)
            return false;

        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()) {

            int s = q.size();

            // Track whether x and y are found in current level
            bool fx = false;
            bool fy = false;

            for (int i = 0; i < s; i++) {

                TreeNode* node = q.front();
                q.pop();

                // Check if current node is x or y
                if (node->val == x)
                    fx = true;

                if (node->val == y)
                    fy = true;

                // Check if x and y are siblings
                if (node->left && node->right) {

                    int lc = node->left->val;
                    int rc = node->right->val;

                    if ((lc == x && rc == y) ||
                        (lc == y && rc == x))
                        return false;
                }

                // Push children for next level
                if (node->left)
                    q.push(node->left);

                if (node->right)
                    q.push(node->right);
            }

            // Both found on same level and not siblings
            if (fx && fy)
                return true;

            // Only one found on this level
            if (fx || fy)
                return false;
        }

        return false;
    }
};