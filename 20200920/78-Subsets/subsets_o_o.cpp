class Solution {
public:
    vector<vector<int>> subsets(vector<int>& nums) {
        vector<vector<int>> subsets;
        subsets.push_back({});
        for(auto& target : nums ) {
             for(int i = 0, count = subsets.size(); i < count; ++i) {
                auto subset = subsets[i];
                subset.push_back(target);
                subsets.push_back(subset);
            }
        }
        return subsets;
    }
};

// Runtime: 4 ms, faster than 66.32% of C++ online submissions for Subsets.
// Memory Usage: 7.1 MB, less than 83.44% of C++ online submissions for Subsets.