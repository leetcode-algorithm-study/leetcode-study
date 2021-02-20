class Solution {
public:
    string largestNumber(vector<int>& nums) {
        string ans = "";
        vector<string> v;

        for (auto i : nums)
        {
            v.push_back(to_string(i));
        }
        sort(v.begin(), v.end(), [](string &a, string &b) {
            return a + b > b + a;
            });
        
        for (auto i : v)
        {
            ans += i;
        }
        int startIdx = 0;
        for (int i = 0; i < ans.size(); i++)
        {
            if (ans[i] == '0'&& i<ans.size()-1)
            {
                startIdx = i + 1;
            }
            else
            {
                break;
            }
        }
        return ans.substr(startIdx);
    }
};

//Runtime: 8 ms, faster than 85.42% of C++ online submissions for Largest Number.
//Memory Usage: 11.4 MB, less than 77.25% of C++ online submissions for Largest Number.
