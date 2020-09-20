class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {

        if (nums1.size() == 0 && nums2.size() == 0) 
        {
            return 0.0;
        }
        
        vector<int> ans;
        double median = 0.0;
        
        
        /* ----- Time Complexity O(m + nlogn) -----*/
        /*
        ans = nums1;
        for (auto i : nums2)
        {
            ans.push_back(i);
        }
        sort(ans.begin(),ans.end());
        */
        
        
        /* ----- Time Complexity O(n + m) ----- */
        int point1 = 0;
        int point2 = 0;

        while (point1 < nums1.size() && point2 < nums2.size())
        {
            if (nums1[point1] <= nums2[point2])
            {
                ans.push_back(nums1[point1++]);
            }
            else
            {
                ans.push_back(nums2[point2++]);
            }
        }
        while (point1 < nums1.size())
        {
            ans.push_back(nums1[point1++]);
        }
        while (point2 < nums2.size())
        {
            ans.push_back(nums2[point2++]);
        }
        ///////////////////////////////////////////////
        
        
        int n = ans.size();
        
        
        if (n % 2 != 0)
        {
            median = ans[n / 2];
        }
        else median = (ans[n / 2] + ans[n / 2 - 1]) / 2.0;

        return median;
    }
};

/*
Runtime: 76 ms, faster than 20.71% of C++ online submissions for Median of Two Sorted Arrays.
Memory Usage: 89.7 MB, less than 21.67% of C++ online submissions for Median of Two Sorted Arrays.
→
Runtime: 60 ms, faster than 41.43% of C++ online submissions for Median of Two Sorted Arrays.
Memory Usage: 89.9 MB, less than 11.10% of C++ online submissions for Median of Two Sorted Arrays.
*/
