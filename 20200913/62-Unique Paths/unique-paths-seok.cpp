/*
How to approach?
Number of cases - Short distance path
N x M - crossed 2D map 
Assume that, a = N + M
It goes on that, answer = aPa / ( N! * M! )
*/

class Solution {
public:
	int M, N;
	long Comb(int a, int maxValue) {
		if (a <= maxValue)
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
		int Max = max(M, N);
		int Min = min(M, N);
		//long res = factorial(M + N) / (factorial(M) * factorial(N));
		return Comb(M + N, Max) / factorial(Min);
        // return factorial(M+N) / (factorial(M) * factorial(N));
        // long long 
	}
};

/*
Runtime: 0 ms, faster than 100.00% of C++ online submissions for Unique Paths.
Memory Usage: 5.9 MB, less than 89.01% of C++ online submissions for Unique Paths.
