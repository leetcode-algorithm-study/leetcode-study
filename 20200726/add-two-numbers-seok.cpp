#define _CRT_SECURE_NO_DEPRECATE
#include <iostream>
#include <vector>
#include <limits.h>

using namespace std;

struct ListNode {
	int val;
	ListNode* next;
	ListNode() : val(0), next(nullptr) {}
	ListNode(int x) : val(x), next(nullptr) {}
	ListNode(int x, ListNode* next) : val(x), next(next) {}

};

class Solution {
public:
	ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
		int sum = 0;
		int carry = 0;
		ListNode* Alist;
		ListNode* Blist;
		ListNode* result = new ListNode;
		ListNode* ans = result;
		Alist = l1;
		Blist = l2;
		while (1)
		{
			sum = carry;
			if (Alist != nullptr)
			{
				sum += (Alist->val);
				Alist = Alist->next;
			}
			if (Blist != nullptr)
			{
				sum += (Blist->val);
				Blist = Blist->next;
			}

			carry = sum / 10;
			result->val = sum % 10;


			if (Alist == nullptr && Blist == nullptr && carry==0)
			{
				break;
			}
			else
			{
				result->next = new ListNode;
				result = result->next;
			}
		}
		return ans;
	}
};


int main()
{
	ListNode ListAOne(0);
	ListNode ListATwo(3, &ListAOne);
	ListNode ListAThree(2, &ListATwo);
	ListNode ListBOne(0);
	ListNode ListBTwo(7, &ListBOne);
	ListNode ListBThree(4, &ListBTwo);

	Solution s;
	ListNode* a;
	a = s.addTwoNumbers(&ListAOne, &ListBOne);

	return 0;
}

/*
Runtime: 68 ms
Memory Usage: 70.4 MB
*/