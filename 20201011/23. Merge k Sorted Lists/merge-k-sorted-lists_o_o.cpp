/**
 * 23. Merge k Sorted Lists ( Hard )
 * You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
 * Merge all the linked-lists into one sorted linked-list and return it.
 */

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
class Solution {
public:
    ListNode* mergeKLists(vector<ListNode*>& lists) {
        if( lists.size() == 0 ) return nullptr;
        ListNode* dest = nullptr;
        for(auto node : lists) {
            if( node == nullptr ) continue;
            if( dest == nullptr ) dest = sorting( node );
            else dest = mergeList(dest, sorting( node ));
        }
        return dest;
    }
    
private:
    ListNode* sorting(ListNode* node) {
        auto next = node->next;
        node->next = nullptr;
        return mergeList( node, next );
    }
    
    ListNode* mergeList(ListNode* dest, ListNode* target) { // dest와 target은 sorting 되어 들어온다고 가정
        assert( dest != nullptr );
        auto lDest = dest, lTarget = target;
        while( lTarget != nullptr) {
            if( lDest->val > lTarget->val ) { // lTarget이 작은 경우 lTarget의 뒤에 lDest를 붙혀줌
                auto tmp = lTarget->next;
                lTarget->next = lDest;
                dest = lDest = lTarget;
                lTarget = tmp;
            } else if(lDest -> next == nullptr) { // lDest가 소진된 경우 lTarget을 뒤에 다 붙혀줌
                lDest->next = lTarget;
                break;
            } else if( lDest->next->val >= lTarget->val ) { // lDest의 뒤에 lTarget을 붙혀줌
                auto tmp = lTarget->next;
                lTarget->next = lDest->next;
                lDest->next = lTarget;
                lTarget = tmp;
            } else { // 추가되지 못하는 경우
                lDest = lDest->next;
            }
        }
        return dest;
    }
};