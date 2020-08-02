#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;
/*
How to approach?

it is focused on finding recurrence formula with the first value of each row. It can be seen that there is a particular regularity for each even and odd terms.

*/

class Solution {
public:
	string convert(string s, int numRows) {
		string ans = "";
		int i = 0;
		int i_store = 0;
		int k;
		int r = numRows;
		int cnt_row = 2;
		int a_init = 0;
		int a_cur;
		bool IsNewRow = true;
		int val_max = s.size();
		// Common difference can be found as below.
		int d_com = (r - 1) * 2;
		if (r == 1)
		{
			d_com = 1;
		}

		while (1)
		{
			if (i >= s.size())
			{
				break;
			}

			// Step 1. Check if it needs to get a new row, then set the initial value.
			if (IsNewRow)
			{
				i_store = i;
				a_init++;
				cnt_row--;
				IsNewRow = false;
				a_cur = a_init;

				ans += s[a_cur - 1];
				i++;
				continue;
			}

			k = i - i_store;

			// Step 2. If the row is either the first or the last, it is just arithmetical progression.
			if (a_init == 1 || a_init == r)
			{
				a_cur = a_init + d_com * k;
			}
			else // If not, follow the sequence equation based on geometric sequence.
			{
				if (k % 2 == 0)
				{
					a_cur = a_init + (d_com) * (k / 2);
				}
				else
				{
					a_cur = cnt_row + d_com * ((k + 1) / 2);
				}
			}

			// Step 3. If the current value is over the last value, it needs to be ignored and go to the next row.
			if (a_cur > s.size())
			{
				IsNewRow = 1;
				continue;
			}

			// Step 4. Append to the answer string and increase the index.
			ans += s[a_cur - 1];
			i++;
		}
		return ans;
	}
};


int main()
{
	string input = "AB";
	int numrows = 1;
	Solution s;
	cout << s.convert(input, numrows);
	return 0;
}

/*
Runtime: 24 ms, faster than 80.08 % of C++ online submissions for ZigZag Conversion.
Memory Usage : 7.9 MB, less than 86.72 % of C++ online submissions for ZigZag Conversion.
*/