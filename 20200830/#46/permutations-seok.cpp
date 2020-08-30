class Solution {
public:
    vector<vector<int>> res;
    void sol(int cnt,vector<int>nums)
    {
        if (cnt >= nums.size())
        {
            res.push_back(nums);
            return;
        }

        for (int i = cnt; i < nums.size(); i++)
        {
            swap(nums[cnt], nums[i]);
            sol(cnt + 1,nums);
        }
    }

    vector<vector<int>> permute(vector<int>& nums) {
        sol(0, nums);
        return res;
    }
};
/*
Runtime: 4 ms, faster than 88.58% of C++ online submissions for Permutations.
Memory Usage: 8.3 MB, less than 23.39% of C++ online submissions for Permutations.
*/
