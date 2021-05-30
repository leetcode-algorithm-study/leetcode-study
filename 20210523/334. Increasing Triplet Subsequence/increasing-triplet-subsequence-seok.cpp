class Solution {
public:
    bool increasingTriplet(vector<int>& nums) {
        int first = INT_MAX;
        int second = INT_MAX;

        for (int i = 0; i < nums.size(); i++)
        {
            if (nums[i] < first)
            {
                first = nums[i];
                cout << "first: " << first << '\n';
            }
            else if (nums[i] > first && nums[i] < second)
            {
                second = nums[i];
                cout << "second: " << second << '\n';
            }
            else if (nums[i] > second)
            {
                cout << "third: " << nums[i] << '\n';
                return true;
            }
        }

        return false;
    }
};