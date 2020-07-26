#define _CRT_SECURE_NO_DEPRECATE
#include <iostream>
#include <vector>
#include <limits.h>

/*
How to access?
When I saw this problem at the very first time, I just combine all among the node. However, I have faced the error in regards to Stack Overflow because of 'sum's value'.
Therefore, I combined every place and then add to the ans's node in considering 'carry bit'.
*/
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
		// Declare and set the variables
		int sum = 0;
		int carry = 0;
		// Declare two of listnode to calculate the summation step by step
		ListNode* Alist;
		ListNode* Blist;
		// in order to sort the order of node, 'ans' is the headnode, and 'result' will be pointing the next node from the beginning to the end
		ListNode* result = new ListNode;
		ListNode* ans = result;
		// set l1 to Alist and l2 to Blist
		Alist = l1;
		Blist = l2;
		while (1)
		{
			// Step 1. If there is a carry, it is added to sum.
			sum = carry;
			// Step 2. Unless either Alist or Blist is null, these are added to sum and then pointed to next node.
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
			// Step 3. Check whether there is carry value and make sum unit's place.
			carry = sum / 10;
			result->val = sum % 10;
			// Step 4. End of condition. Unless so, 'result' points to the next node.
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
