class Solution {
public:
	int M, N;
	int Max,Min;
	long sol(int a) {
		if (a <= Max)
		{
			return 1;
		}
		return sol(a - 1) * a;
	}
	long factorial(int a) {
		if (a <= 1)
		{
			return 1;
		}
		return factorial(a - 1) * a;
	}
	int uniquePaths(int m, int n) {
		M = m - 1;
		N = n - 1;
		Max = max(M, N);
		Min = min(M, N);
		//long res = factorial(M + N) / (factorial(M) * factorial(N));
		return sol(M + N) / factorial(Min);
	}
};

/*
Runtime: 0 ms, faster than 100.00% of C++ online submissions for Unique Paths.
Memory Usage: 5.9 MB, less than 89.01% of C++ online submissions for Unique Paths.
*/
