
struct ListNode {
	int val;
	ListNode* next;
	ListNode() : val(0), next(nullptr) {}
	ListNode(int x) : val(x), next(nullptr) {}
	ListNode(int x, ListNode* next) : val(x), next(next) {}
};

class Solution {
public:

	ListNode* sortList(ListNode* head) {
		if (head == NULL || head->next == NULL)
		{
			return head;
		}
		ListNode* h1 = head;
		ListNode* h2 = head;
		int cnt = 0;
		while (h2)
		{
			h2 = h2->next;
			cnt++;
		}
		cnt = cnt / 2;
		h2 = head;
		while (cnt--)
		{
			h2 = h2->next;
			if (cnt == 0)
			{
				h1->next = NULL;
			}
			else
			{
				h1 = h1->next;
			}
		}
		h1 = sortList(head);
		h2 = sortList(h2);

		head = mergeList(h1, h2);

		return head;
	}
	ListNode* mergeList(ListNode* h1, ListNode* h2)
	{
		ListNode* mergedList = new ListNode();
		ListNode* head = mergedList;
		while (h1 && h2)
		{
			if (h1->val < h2->val)
			{
				mergedList->val = h1->val;
				h1 = h1->next;
			}
			else
			{
				mergedList->val = h2->val;
				h2 = h2->next;
			}
			mergedList->next = new ListNode();
			mergedList = mergedList->next;
		}
		while (h1)
		{
			mergedList->val = h1->val;
			h1 = h1->next;
			if (h1)
			{
				mergedList->next = new ListNode();
				mergedList = mergedList->next;
			}
		}
		while (h2)
		{
			mergedList->val = h2->val;
			h2 = h2->next;
			if (h2)
			{
				mergedList->next = new ListNode();
				mergedList = mergedList->next;
			}
		}
		return head;
	}
};

//Runtime: 284 ms, faster than 7.71 % of C++ online submissions for Sort List.
//Memory Usage : 113.5 MB, less than 6.16 % of C++ online submissions for Sort List.