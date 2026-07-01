/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {  //2 POINTER (FAST & SLOW )
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode *ptr=head, *temp=head;   //ptr : fast pointer at head  // temp = slow pointer at head 
        for(int i=0;i<n;i++) //ptr moves n steps ahead
           ptr=ptr->next;

        // if ptr becomes null,it means we have to delete the 1st node 
        //After moving ptr 3 steps:

          //ptr = NULL
         // This means the node to remove is the head (1).
        // So simply return
        // head->next
        if(!ptr)  
           return head->next;


/*This means:
Continue while the next node exists.
Stop when ptr->next == NULL.
Since the last node of every linked list already has its next pointer set to NULL, 
the loop automatically stops there.*/

        while(ptr->next){ //move both pointers together  until ptr reaches the last node 
            ptr=ptr->next ;   //fast pointer moves one step
            temp=temp->next;  //slow pointer moves one step 
        }
        //skip the node to be deleted 
         temp->next=temp->next->next;

         //return updated head 
         return head ;
    }
};

/*This method efficiently solves the problem in one traversal (O(N) time) while using only constant extra space (O(1)).*/