// origin - https://github.com/o-oppang/lets-solve-algorithm
/**
 * A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 * 
 * The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 * 
 * How many possible unique paths are there?
 * 
 * 
 * Above is a 7 x 3 grid. How many possible unique paths are there?
 * 
 *  
 * 
 * Example 1:
 * 
 * Input: m = 3, n = 2
 * Output: 3
 * Explanation:
 * From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 * 1. Right -> Right -> Down
 * 2. Right -> Down -> Right
 * 3. Down -> Right -> Right
 **/

class Solution {
public:
    int uniquePaths(int m, int n) {
        auto row = vector<int>( m, 1 );
        for( auto i = 1; i < n; ++i )
            for( auto j = 1; j < m; ++j) 
                    row[j] += row[j - 1];
        return row[m - 1];
    }
};

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Unique Paths.
// Memory Usage: 6.1 MB, less than 54.01% of C++ online submissions for Unique Paths.