class Solution {
public:
	ListNode* merge(ListNode* l1, ListNode* l2)
	{
		ListNode* res = new ListNode;
		ListNode* head = res;
		while (l1 || l2)
		{
			if (l1 == NULL)
			{
				res->next = l2;
				l2 = l2->next;
			}
			else if (l2 == NULL)
			{
				res->next = l1;
				l1 = l1->next;
			}
			else if (l1->val > l2->val)
			{
				res->next = l2;
				l2 = l2->next;
			}
			else
			{
				res->next = l1;
				l1 = l1->next;
			}
			res = res->next;
		}
		return head->next;
	}
	ListNode* mergeKLists(vector<ListNode*>& lists) {
		if (!lists.size())
		{
			return NULL;
		}
		ListNode* ans = new ListNode;
		ListNode* l1 = new ListNode;
		ListNode* l2 = new ListNode;

		l1 = lists.back();
		lists.pop_back();

		while (lists.size())
		{
			l2 = lists.back();
			lists.pop_back();
			l1 = merge(l1, l2);
		}

		return l1;

	}
};

/*
Runtime: 292 ms
Memory Usage: 13.7 MB
*/
