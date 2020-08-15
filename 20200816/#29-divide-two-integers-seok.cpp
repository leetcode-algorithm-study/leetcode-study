class Solution {
public:
	int divide(int dividend, int divisor) {
        if(dividend==INT_MIN && divisor==-1)
        {
            return INT_MAX;
        }
		int dividend_local=dividend;
        int divisor_local = divisor;
		int res= dividend_local/divisor_local;
        if(res>INT_MAX || res<INT_MIN)
        {
            return INT_MAX;
        }
        int ans = res;
		return ans;
	}
};
