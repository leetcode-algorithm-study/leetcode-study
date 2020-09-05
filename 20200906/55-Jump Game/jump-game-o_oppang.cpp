// origin - https://github.com/o-oppang/lets-solve-algorithm.git
/**
 * Given an array of non-negative integers, you are initially positioned at the first index of the array.
 * 
 * Each element in the array represents your maximum jump length at that position.
 * 
 * Determine if you are able to reach the last index.
 * 
 *  
 * 
 * Example 1:
 * 
 * Input: nums = [2,3,1,1,4]
 * Output: true
 * Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 * Example 2:
 * 
 * Input: nums = [3,2,1,0,4]
 * Output: false
 * Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
 *  
 * 
 * Constraints:
 * 
 * 1 <= nums.length <= 3 * 10^4
 * 0 <= nums[i][j] <= 10^5
 */

class Solution {
public:
    bool canJump(vector<int>& nums) {
        if (nums[0] >= nums.size() - 1) return true;
        
        auto begin = nums.begin();
        auto end = nums.begin() + *begin;
        
        while( begin != end ) {
            unsigned int maxIndex = 1;
            for( auto iter = begin; iter <= end; ++iter ) {
                auto reachableIndex = iter - nums.begin() + *iter;
                if( maxIndex < reachableIndex ) maxIndex = reachableIndex;
            }
            
            if( maxIndex >= nums.size() - 1 ) return true;
            
            begin = end;
            end = nums.begin() + maxIndex;
        }
        return false;
    }
};
// Runtime: 20 ms, faster than 84.61% of C++ online submissions for Jump Game.
// Memory Usage: 12.8 MB, less than 81.44% of C++ online submissions for Jump Game.