class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        k = k % nums.size(); // [-1], 2
        reverse(nums.rbegin(), nums.rbegin() + k);
        reverse(nums.rbegin() + k, nums.rend());
        reverse(nums.begin(), nums.end());
    }
};
//[1,2,3,4,5,6,7,8] k = 3

//[6,7,8,1,2,3,4,5]
//[5,4,3,2,1,8,7,6]
//[1,2,3,4,5, 6,7,8]

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Rotate Array.
// Memory Usage: 9.9 MB, less than 85.05% of C++ online submissions for Rotate Array.