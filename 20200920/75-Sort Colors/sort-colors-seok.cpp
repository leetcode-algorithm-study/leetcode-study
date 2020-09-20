class Solution {
public:
    void sortColors(vector<int>& nums) {
        int left = 0;
        int mid = 0; 
        int right = nums.size() - 1;
        while (mid <= right) {
            if (nums[mid] == 0)
            {
                swap(nums[left++], nums[mid++]);
            }
            else if (nums[mid] == 1)
            {
                mid++;
                
            }
            else
            {
                swap(nums[mid], nums[right--]);
            }
        }
    }
};

/*
Runtime: 8 ms, faster than 9.42% of C++ online submissions for Sort Colors.
Memory Usage: 8.7 MB, less than 5.14% of C++ online submissions for Sort Colors.
*/
