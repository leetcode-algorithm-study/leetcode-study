/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};
*/

class Solution {
public:
    Node* copyRandomList(Node* head) {
        if( head == nullptr ) return nullptr;
        map<Node*, Node*> nodeMap;
        Node* targetHead = head;
        for( auto i = 0; targetHead != nullptr; ++i, targetHead = targetHead->next ) {
            auto newNode = new Node( targetHead->val );
            newNode->next = targetHead->next;
            newNode->random = targetHead->random;
            nodeMap[targetHead] = newNode;
        }
        targetHead = nodeMap[head];
        for( auto i = 0; targetHead != nullptr; ++i, targetHead = targetHead->next ) {
            if( targetHead->next ) targetHead->next = nodeMap[targetHead->next];
            if( targetHead->random ) targetHead->random = nodeMap[targetHead->random];
        }
        return nodeMap[head];
    }
};