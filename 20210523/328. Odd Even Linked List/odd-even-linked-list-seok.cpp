class Solution {
public:
	ListNode* oddEvenList(ListNode* head) {
		if (!head) return NULL;

		ListNode* odd = head;
		ListNode* even = odd->next;
		ListNode* nextodd, * nexteven;
		ListNode* t1 = odd;
		ListNode* t2 = even;

		while (odd && even)
		{
			nextodd = even->next;
			nexteven = (nextodd) ? nextodd->next : NULL;
			odd->next = nextodd;
			even->next = nexteven;
			if (nextodd)odd = odd->next;
			even = even->next;
		}

		if (t2)		odd->next = t2;
		return t1;
	}
};