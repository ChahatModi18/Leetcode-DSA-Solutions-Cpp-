class Solution {
public:
    bool hasCycle(ListNode *head) {

        // Two pointers starting from the head
        ListNode *slow = head;   // moves 1 step at a time
        ListNode *fast = head;   // moves 2 steps at a time

        // Continue until fast reaches the end of the list
        while (fast != nullptr && fast->next != nullptr) {

            // Move slow pointer by 1 node
            slow = slow->next;

            // Move fast pointer by 2 nodes
            fast = fast->next->next;

            // If both pointers meet,
            // a cycle exists in the linked list
            if (slow == fast) {
                return true;
            }
        }

        // If fast reaches NULL,
        // the linked list ends normally
        // so there is no cycle
        return false;
    }
};