class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int peakVal = INT_MIN, peakIndex = 0;
        for( auto i = 0; i < nums.size(); ++i ) {
            if( nums[i] > peakVal ) {
                peakVal = nums[i];
                peakIndex = i;
            }
        }
        return peakIndex;
    }
};

//Runtime: 4 ms, faster than 95.85% of C++ online submissions for Find Peak Element.
//Memory Usage: 9.2 MB, less than 30.85% of C++ online submissions for Find Peak Element.