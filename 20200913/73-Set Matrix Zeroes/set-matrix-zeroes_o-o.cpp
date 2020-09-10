// origin - https://github.com/o-oppang/lets-solve-algorithm
/**
 * Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.
 * 
 * Follow up:
 * 
 * A straight forward solution using O(mn) space is probably a bad idea.
 * A simple improvement uses O(m + n) space, but still not the best solution.
 * Could you devise a constant space solution?
 *  
 * 
 * Example 1:
 * 
 * Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 * Output: [[1,0,1],[0,0,0],[1,0,1]]
 */

class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        set<int> rows, cols;
        
        for( auto i = 0; i < matrix.size(); ++i ) // row
            for( auto j = 0; j < matrix[0].size(); ++j ) // col
                if( matrix[i][j] == 0 )  { rows.insert(i); cols.insert(j); }

        for( auto row : rows ) // fill rows to zero
            std::fill(matrix[row].begin(), matrix[row].end(), 0);
        
        for( auto col : cols ) // fill cols to zero
            for( auto row = 0; row < matrix.size(); ++row )
                std::fill(matrix[row].begin() + col, matrix[row].begin() + col + 1, 0);
    }
};
// Runtime: 24 ms, faster than 94.25% of C++ online submissions for Set Matrix Zeroes.
// Memory Usage: 13.3 MB, less than 49.73% of C++ online submissions for Set Matrix Zeroes.