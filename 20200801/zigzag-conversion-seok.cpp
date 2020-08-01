#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;


class Solution {
public:
	string convert(string s, int numRows) {
		string ans = "";
		int i=0;
		int i_store = 0;
		int k;
		int r = numRows;
		int val_max = s.size();
		int d_com = (r - 1) * 2;
		if (r == 1)
		{
			d_com = 1;
		}
		int d_odd = d_com;
		int d_even = d_com;
		int cnt_row = 2;
		vector<int>v;
		int a_cur;
		int a_init = 0;
		bool IsNewRow = true;
		
		while(1)
		{
			
			top:
			if (i >= s.size())
			{
				break;
			}
			// Step 1. Check if it needs to get a new row.
			if (IsNewRow)
			{
				i_store = i;
				a_init++;
				cnt_row--;
				IsNewRow = false;
				a_cur = a_init;
				v.push_back(a_cur-1);
				goto bot;
			}
			k = i - i_store;

			// Step 2-1. If the row is either the first or the last, it is just arithmetical progression.
			if (a_init == 1 || a_init == r)
			{
				a_cur = a_init + d_com * k;
			}
			else // If not,
			{
				if (k % 2 == 0)
				{
					a_cur = a_init + (d_even) * (k / 2);
				}
				else
				{
					a_cur = cnt_row + d_odd * ((k + 1) / 2);
				}
			}


			if (a_cur > s.size())
			{
				IsNewRow = 1;
				goto top;
			}
			v.push_back(a_cur-1);
			bot:
			i++;
		}

		for (auto iter : v)
		{
			ans += s[iter];
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