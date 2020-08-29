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
            swap(nums[i], nums[cnt]);
        }
    }

    vector<vector<int>> permute(vector<int>& nums) {
        sol(0, nums);
        return res;
    }
};
/*
Runtime: 4 ms
Memory Usage: 8.6 MB
*/
