// origin - https://github.com/o-oppang/lets-solve-algorithm.git
/**
* Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
* 
* Example 1:
* 
* Input:
* [
*  [ 1, 2, 3 ],
*  [ 4, 5, 6 ],
*  [ 7, 8, 9 ]
* ]
* Output: [1,2,3,6,9,8,7,4,5]
* Example 2:
* 
* Input:
* [
*   [1, 2, 3, 4],
*   [5, 6, 7, 8],
*   [9,10,11,12]
* ]
* Output: [1,2,3,4,8,12,11,10,9,5,6,7]
*/


class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        vector<int> retVal;
        while( matrix.size() != 0 && matrix[0].size() != 0 ) {
            auto front = matrix.front();
            matrix.erase(matrix.begin());
            for( auto append : front ) {
                retVal.push_back( append );
            } // In top row, right way append and pop
            
            if( matrix.size() == 0 ) break;
            
            for( auto& vec : matrix ) {
                retVal.push_back( vec.back());
                vec.pop_back();
            } // In left column, down way append and pop
            
            if( matrix[0].size() == 0 ) break;
            
            auto back = matrix.back();
            matrix.pop_back();
            for( auto appendIter = back.rbegin(); appendIter != back.rend(); ++appendIter ) {
                retVal.push_back( *appendIter );
            } // In bottom row, left way append and pop
            
            if( matrix.size() == 0 ) break;
            
            for( auto appendVecIt = matrix.rbegin(); appendVecIt != matrix.rend(); ++appendVecIt ) {
                retVal.push_back( appendVecIt->front() );
                appendVecIt->erase( appendVecIt->begin() );
            } // In left column, up way append and pop
            
        }
        return retVal;
    }
};

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Spiral Matrix.
// Memory Usage: 6.9 MB, less than 84.67% of C++ online submissions for Spiral Matrix.