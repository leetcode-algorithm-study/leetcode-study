// origin is https://github.com/o-oppang/lets-solve-algorithm.git
// leet code #11
// Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai).
// n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, 
// which together with x-axis forms a container, such that the container contains the most water.

// Note: You may not slant the container and n is at least 2.

// #include <iostream>
// #include <vector>
// #include <map>
// #include <cstdlib>

using namespace std;

class Solution {
public:
    int maxArea(vector<int>& height) {
        int maxArea = 0;
        for( auto i = height.begin(), j = height.end() - 1; i < j ; ) {
            auto area = std::distance( i, j ) * std::min( *i, *j );
            maxArea = maxArea > area ? maxArea : area;
            if( *i > *j ) {
                --j;
            } else {
                ++i;
            }
                
        }
    }
};
