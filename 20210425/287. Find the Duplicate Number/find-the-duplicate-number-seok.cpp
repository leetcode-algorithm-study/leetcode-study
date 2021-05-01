
/* first attemption */
//Runtime: 180 ms, faster than 5.23% of C++ online submissions for Find the Duplicate Number.
//Memory Usage : 83.8 MB, less than 5.80 % of C++ online submissions for Find the Duplicate Number.

class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int ans = 0;
        unordered_map<int, int> m;
        for (int i = 0; i < nums.size(); i++)
        {
            if (m.find(nums[i]) == m.end())
            {
                m.insert({ nums[i],1 });
            }
            else
            {
                m[ans = nums[i]]++;
                break;
            }
        }
        return ans;
    }
};

/* second attemption as a reference */
//Runtime: 104 ms, faster than 5.23% of C++ online submissions for Find the Duplicate Number.
//Memory Usage : 61.2 MB, less than 5.80 % of C++ online submissions for Find the Duplicate Number.

class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        int ans = 0;
        for (int i = 0; i < nums.size(); i++)
        {
            if (nums[abs(nums[i]) - 1] < 0)
            {
                ans = abs(nums[i]);
            }
            else
            {
                nums[abs(nums[i]) - 1] *= -1;
            }
        }
        return ans;
    }
};