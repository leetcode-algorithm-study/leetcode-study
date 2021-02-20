class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        unordered_map<int,bool> map;
        int consecutiveCount = 0;
        for( const auto num : nums )
            map[num] = true;

        for( const auto seed : map )
        {
            if( seed.second )
            {
                auto left = seed.first;
                auto right = seed.first + 1;
                while( map.find( left ) != map.end() && map[left] )
                    map[left--] = false;
                while( map.find( right ) != map.end() && map[right] )
                    map[right++] = false;
                consecutiveCount = consecutiveCount( ret, right - left  - 1 );
            }
        }   
        return consecutiveCount;
    }
};
// Runtime: 16 ms, faster than 83.04% of C++ online submissions for Longest Consecutive Sequence.
// Memory Usage: 11 MB, less than 74.01% of C++ online submissions for Longest Consecutive Sequence.