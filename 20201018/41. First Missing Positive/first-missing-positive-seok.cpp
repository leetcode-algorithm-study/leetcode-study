class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        sort(nums.begin(),nums.end());
        int minPositive=1;
        for(auto iter=nums.begin();iter!=nums.end();iter++)
        {
            int i=*iter;
            if(i<1)
            {
                continue;
            }
            if(i==minPositive)
            {
                minPositive++;
            }
        }
        return minPositive;
    }
};

/*
Runtime: 4 ms, faster than 78.24% of C++ online submissions for First Missing Positive.
Memory Usage: 9.9 MB, less than 99.99% of C++ online submissions for First Missing Positive.
*/
