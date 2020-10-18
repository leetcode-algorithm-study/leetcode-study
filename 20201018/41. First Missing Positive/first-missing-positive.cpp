/**
 *Given an unsorted integer array nums, find the smallest missing positive integer.
 *
 *Follow up: Could you implement an algorithm that runs in O(n) time and uses constant extra space.?
 *
 * 
 *
 *Example 1:
 *
 *Input: nums = [1,2,0]
 *Output: 3
 *Example 2:
 *
 *Input: nums = [3,4,-1,1]
 *Output: 2
 *Example 3:
 *
 *Input: nums = [7,8,9,11,12]
 *
 *Output: 1
 */

class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        if( nums.size() == 0 ) return 1;
        auto mark = vector<bool>(nums.size(), false);
        for(auto num : nums) {
            if( num > 0 && num <= nums.size() ) {
                mark[num] = true;
            }
        }
        
        for( auto i = 1 ; i <= mark.size(); ++i ) {
            if( mark[i] == false ) {
                return i;
            }
        }
        return mark.size() + 1;
    }
};

// Runtime: 4 ms, faster than 78.13% of C++ online submissions for First Missing Positive.
// Memory Usage: 10 MB, less than 99.99% of C++ online submissions for First Missing Positive.