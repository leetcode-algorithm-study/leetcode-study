class Solution {
private:
	int getOperand(string s)
	{
		int a = 0;
		int b = 1;
		for (int i = 0; i < s.size();)
		{
			if (s[i]-'0' >= 0 && s[i]-'0'<= 9)
			{
				a += (s[i] - '0');
				i++;
				if (i < s.size())
				{
					a *= 10;
				}
			}
			else
			{
				b *= -1;
				i++;
			}
		}
		return a*b;
	}
	int getOperator(int a, int b, char op)
	{
		int ans;
		switch (op)
		{
		case '+':
			ans = a + b;
			break;
		case '-':
			ans = a - b;
			break;
		case '*':
			ans = a * b;
			break;
		case '/':
			ans = a / b;
		default:
			break;
		}
		return ans;
	}
public:
	int evalRPN(vector<string>& tokens) {
		int res = 0;
		int a, b;
		char target;
		stack<int> ST_operand;
		for (int i = 0; i < tokens.size(); i++)
		{
			target = tokens[i][0];
 			if ((target == '+' || target == '-' || target == '*' || target == '/') && tokens[i].size()==1)
			{
				b = ST_operand.top();
				ST_operand.pop();
				a = ST_operand.top();
				ST_operand.pop();
				ST_operand.push(getOperator(a, b, target));
			}
			else
			{
				ST_operand.push(getOperand(tokens[i]));
			}
		}
		return ST_operand.top();
	}
};

//Runtime: 16 ms, faster than 78.77% of C++ online submissions for Evaluate Reverse Polish Notation.
//Memory Usage: 12.2 MB, less than 79.94% of C++ online submissions for Evaluate Reverse Polish Notation.
