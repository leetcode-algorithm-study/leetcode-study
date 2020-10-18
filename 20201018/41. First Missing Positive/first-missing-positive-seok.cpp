class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        bool containOne=false;
        for(auto i:nums)
        {
            if(i==1)
            {
                containOne=true;
                break;
            }
        }
        if(!containOne)
            return 1;
        
        int n=nums.size();
        if(n==1)
            return 2;
        
        for(int i=0;i<n;i++)
        {
            if(nums[i]<=0||nums[i]>n)
                nums[i]=1;
        }
        for(int i=0;i<n;i++)
        {
            int j=abs(nums[i]);
            if(nums[j-1]>0)
                nums[j-1]*=-1;
        }
        for(int i=0;i<n;i++)
        {
            if(nums[i]>0)
                return i+1;
        }
        
        return n+1;
    }
};

/*
Runtime: 4 ms, faster than 78.24% of C++ online submissions for First Missing Positive.
Memory Usage: 9.9 MB, less than 99.99% of C++ online submissions for First Missing Positive.
*/
