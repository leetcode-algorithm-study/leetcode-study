#include <iostream>
#include <vector>
#include <string>
#include <stack>

/*
How to approach?
Stack을 통한 유효문자열 확인 + DFS를 통한 괄호 경우의수 생성
*/

using namespace std;

class Solution {
public:
	int n_global = 0;
	vector<string> ans_global;

	bool check(string str)
	{
		stack<char> st;
		for (int i = 0; i < str.size(); i++)
		{
			if (str[i] == '(')
			{
				st.push('(');
			}
			else if (str[i] == ')')
			{
				if (st.empty() == 1)
				{
					st.push(')');
				}
				else if (st.top() == '(')
				{
					st.pop();
				}
			}
		}
		if (st.empty() == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	void dfs(string str)
	{
		if (str.size() >= n_global*2)
		{
			if (check(str))
			{
				if (!count(ans_global.begin(), ans_global.end(), str))
				{
					ans_global.push_back(str);
				}
			}
			return;
		}


		dfs(str + '(');
		dfs(str + ')');

	}
	vector<string> generateParenthesis(int n) {
		n_global = n;
		string st = "";
		dfs(st);

		vector<string> ans = ans_global;

		return ans;
	}
};

int main()
{
	int n = 3;
	Solution s;
	s.generateParenthesis(n);
	return 0;
}

/*
Runtime: 296 ms, faster than 5.29% of C++ online submissions for Generate Parentheses.
Memory Usage: 229.6 MB, less than 5.01% of C++ online submissions for Generate Parentheses.
*/
