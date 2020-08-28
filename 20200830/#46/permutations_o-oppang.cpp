/**
 * Given a collection of distinct integers, return all possible permutations.
 * 
 * Input: [1,2,3]
 * Output:
 * [
 *   [1,2,3],
 *   [1,3,2],
 *   [2,1,3],
 *   [2,3,1],
 *   [3,1,2],
 *   [3,2,1]
 *  ]
 */

class Solution 
{
public:
    vector<vector<int>> permute(vector<int>& nums) 
    {
        // vector<vector<int>> retVectors = { { nums.back() } };
        auto retVectors = std::make_shared<vector<vector<int>>>(0);
        retVectors->push_back({nums.back()});
        nums.pop_back();

        while( nums.size() > 0 ) 
        {
            auto appendVal = nums.back();
            nums.pop_back();
            
            auto destVectors = std::make_shared<vector<vector<int>>>(0);
            for( auto i = retVectors->begin(); i < retVectors->end(); i++ ) 
            {
                auto targetVec = *i;
                for( auto appendIndex = 0; appendIndex <= targetVec.size(); appendIndex++ ) 
                {
                    vector<int> dest = targetVec;
                    dest.insert(dest.begin() + appendIndex, appendVal);
                    destVectors->push_back( dest );
                }
            }
            retVectors = std::move( destVectors );
        }
        return retVectors.get();
    }
};

// Runtime: 4 ms, faster than 88.47% of C++ online submissions for Permutations.
// Memory Usage: 8.7 MB, less than 14.18% of C++ online submissions for Permutations.