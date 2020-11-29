
using namespace std;
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
class Solution {
public:
    Node* copyRandomList(Node* head) {

        Node* root = head;
        unordered_map<Node*, Node*> map;

        while (root) {
            Node* nodeVal = new Node(root->val);
            map[root] = nodeVal;
            root = root->next;
        }
        root = head;

        while (root) {
            map[root]->next = map[root->next];
            map[root]->random = map[root->random];
            root = root->next;
        }
        return map[head];
    }
};

//Runtime: 20 ms, faster than 42.47 % of C++ online submissions for Copy List with Random Pointer.
//Memory Usage : 11.5 MB, less than 35.00 % of C++ online submissions for Copy List with Random Pointer.