// origin is https://github.com/o-oppang/lets-solve-algorithm.git
// Given an array nums of n integers, are there elements 
// a, b, c in nums such that a + b + c = 0? Find all unique triplets
// in the array which gives the sum of zero.

class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        if( nums.size() < 3 ) return {};
        std::sort(nums.begin(), nums.end());
        vector<vector<int>> triplets;
        for(auto i = nums.begin(); i < nums.end() - 2; ++i)
        {
            auto low = i + 1;
            auto high = nums.end() - 1;
            while(low < high) {
                auto calcVal = *i + *low + *high;
                if( calcVal == 0 ) {
                    triplets.push_back( {*i, *low, *high} );
                }
                int last = 0, updated = 0;
                while( (last == updated) && low < high) {
                    if( calcVal <= 0 ) {
                        last = *low;
                        updated = *(++low);
                    } else {
                        last = *high;
                        updated = *(--high);
                    }    
                }
            }
            while(*i == *(i + 1) && i < nums.end()) {
                if( ++i == nums.end() - 1 ) break;
            }
        }
        return triplets;
    }
};

// Runtime: 128 ms, faster than 60.99% of C++ online submissions for 3Sum.
// Memory Usage: 19.9 MB, less than 57.84% of C++ online submissions for 3Sum.
