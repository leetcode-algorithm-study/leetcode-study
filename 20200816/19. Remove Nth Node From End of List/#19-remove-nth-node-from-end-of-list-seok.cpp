#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

/*
How to approach?
첫번째 while 문을 통해 node의 depth를 구한 뒤
nth node의 위치를 앞에서부터 파악하여, 해당 node를 제거해준다.
*/


struct ListNode {
	int val;
	ListNode* next;
	ListNode() : val(0), next(nullptr) {}
	ListNode(int x) : val(x), next(nullptr) {}
	ListNode(int x, ListNode* next) : val(x), next(next) {}
};

class Solution {
public:
	ListNode* removeNthFromEnd(ListNode* head, int n) {
		ListNode* InputNode = head;
		ListNode* tmp = new ListNode;
		ListNode* res = new ListNode;

		int tmp_val;
		int cnt = 0;
		int n_reverse;
		while (InputNode != nullptr)
		{
			cnt++;
			InputNode = InputNode->next;
		}

		n_reverse = cnt - n;
		if (n_reverse == 0)
		{
			head = head->next;
		}
		else
		{

			tmp = NULL;
			res = head;

			for (int i = 0; i < n_reverse; i++)
			{
				tmp = res;
				res = res->next;
			}
			tmp->next = res->next;
		}

		return head;
	}
};

int main()
{
	Solution s;
	ListNode Five(5);
	ListNode Four(4, &Five);
	ListNode Three(3, &Four);
	ListNode Two(2, &Three);
	ListNode One(1, &Two);
	s.removeNthFromEnd(&One, 3);


	return 0;
}

/*
Runtime: 8 ms
Memory Usage: 10.7 MB
*/
