
class Node {
public:
	int val;
	Node* left;
	Node* right;
	Node* next;

	Node() : val(0), left(NULL), right(NULL), next(NULL) {}

	Node(int _val) : val(_val), left(NULL), right(NULL), next(NULL) {}

	Node(int _val, Node* _left, Node* _right, Node* _next)
		: val(_val), left(_left), right(_right), next(_next) {}
};


class Solution {
public:
	Node* connect(Node* root) {
		Node* curr;
		queue<Node*> q;
		q.push(root);
		while (!q.empty())
		{
			curr = q.front();
			q.pop();
			if (curr->left)
			{
				curr->left->next = curr->right;
				
				if (curr->next)
				{
					curr->right->next = curr->next->left;
				}
				q.push(curr->left);
				q.push(curr->right);
			}
		}

		return root;
	}
};

/*
Runtime: 24 ms, faster than 53.48% of C++ online submissions for Populating Next Right Pointers in Each Node.
Memory Usage: 17.7 MB, less than 27.24% of C++ online submissions for Populating Next Right Pointers in Each Node.
*/