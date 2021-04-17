//Runtime: 20 ms, faster than 81.73% of C++ online submissions for Product of Array Except Self.
//Memory Usage: 24 MB, less than 70.43% of C++ online submissions for Product of Array Except Self.

class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int Size = nums.size();
        vector<int> ans(Size);
        vector<pair<int,int>> vproduct;
        int product = 1;
        
        for(int i=0; i<nums.size(); i++)
        {
            if(nums[i]==0) 
            {
                vproduct.push_back({product,i});
                product *= nums[i];
            }
            else
            {
                product *=nums[i];
            }
            int idx = 0;
            while(idx<vproduct.size())
            {
                if(vproduct[idx].second != i)
                {
                    vproduct[idx].first*=nums[i];
                }
                idx++;
            }
        }
        
        int idx = 0;
        for(int i=0; i<nums.size(); i++)
        {
            if(nums[i]==0)
            {
                ans[i] = vproduct[idx++].first;
            }
            else
            {
                ans[i] = (product/nums[i]);
            }            
        }
        return ans;
    }
};
