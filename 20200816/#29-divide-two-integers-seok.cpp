

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;



class Solution {
public:
	int divide(int dividend, int divisor)
	{
		if (dividend == INT_MIN && divisor == -1)
		{
			return INT_MAX;
		}

		int dividendL = abs(dividend);
		int divisorL = abs(divisor);
		int res = 0;
		int isNegative = false;

		if (dividend < 0 && divisor>0)
		{
			isNegative = true;
		}
		else if (dividend > 0 && divisor < 0)
		{
			isNegative = true;
		}

		while (dividendL >= divisorL)
		{
			int exp = 0;
			while (dividendL  >= (divisorL << exp << 1))
			{
				exp++;
			}
			res += 1 << exp;
			dividendL -= (divisorL << exp);
		}
		return isNegative ? -res : res;
	}
};

int main()
{
	int dividend = 2147483647;
	int divisor = 1;
	Solution s;
	s.divide(dividend, divisor);

	return 0;
}
