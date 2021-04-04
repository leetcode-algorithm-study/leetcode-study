//Runtime: 20 ms, faster than 21.75 % of C++ online submissions for Basic Calculator II.
//Memory Usage : 7.8 MB, less than 82.39 % of C++ online submissions for Basic Calculator II

class Solution {
private:
	char compareOp(char a)
	{
		return (a == '*' || a == '/') ? 2 :
			(a == '+' || a == '-') ? 1 : -1;
	}
	bool operateCal(vector<int>& polish, char op)
	{
		int b = polish.back();
		polish.pop_back();
		int a = polish.back();
		polish.pop_back();
		int c;
		switch (op)
		{
		case '+':
			c = a + b;
			break;
		case '-':
			c = a - b;
			break;
		case '*':
			c = a * b;
			break;
		case '/':
			c = a / b;
			break;
		default:
			return false;
		}
		polish.push_back(c);
		return true;
	}
public:
	int calculate(string s) {
		vector<int> polish;
		vector<char> op;
		int idx = 0;
		s.erase(remove(s.begin(), s.end(), ' '), s.end());
		while (idx < s.size())
		{
			string tmp;
			if (s[idx] >= '0' && s[idx] <= '9')
			{
				string num = "";
				while (s[idx] >= '0' && s[idx] <= '9')
				{
					num += s[idx++];
				}
				polish.push_back(stoi(num));
			}
			else if (s[idx] == '+' || s[idx] == '-' || s[idx] == '*' || s[idx] == '/')
			{
				while (!op.empty() && compareOp(op.back()) >= compareOp(s[idx]))
				{
					operateCal(polish, op.back());
					op.pop_back();
				}
				op.push_back(s[idx++]);
			}
		}
		while (!op.empty())
		{
			operateCal(polish, op.back());
			op.pop_back();
		}
		return polish.back();
	}
};
