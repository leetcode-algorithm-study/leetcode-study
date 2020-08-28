/**
 * You are given an n x n 2D matrix representing an image.
 * Rotate the image by 90 degrees (clockwise).
 * 
 * Note:
 * 
 * You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 * 
 * Example 1:
 * 
 * Given input matrix = 
 * [
 *   [1,2,3],
 *   [4,5,6],
 *   [7,8,9]
 * ],
 * 
 * rotate the input matrix in-place such that it becomes:
 * [
 *   [7,4,1],
 *   [8,5,2],
 *   [9,6,3]
 * ]
 */

class Solution {
public:


    void rotatePosition90( vector<int>& position, int n )
    {
        auto x = position[0];
        auto y = position[1];
        position[0] = y;
        position[1] = n - 1 - x;
    }
    
    void rotate(vector<vector<int>>& matrix) {
        auto n = matrix.size();
        auto position = vector<int>( 2 );
        auto prevValue = 0.0f;
        for( auto i = 0; i < floor( n / 2.0f ); ++i ) {
            for( auto j = i; j < n - 1 - i; ++j ) {
                position[0] = i;
                position[1] = j;
                prevValue = matrix[position[0]][position[1]];
                for( auto notUse = 0; notUse < 4; ++notUse ) {
                    rotatePosition90(position, n);
                    auto value = matrix[position[0]][position[1]];
                    matrix[position[0]][position[1]] = prevValue;
                    prevValue = value;
                }
                
            }
        }
    }
};


// | 1 0  0  |   | 0  1  0 |   | 0  1   0  |
// | 0 1 n-1 | * | -1 0  0 | = | -1 0  n-1 |
// | 0 0  1  |   | 0  0  1 |   | 0  0   1  |
//  t matrix    r matrix(-90도)

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Rotate Image.
// Memory Usage: 7.4 MB, less than 9.77% of C++ online submissions for Rotate Image.