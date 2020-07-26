#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string str) {
        string ans = "";
        int i;
        int st = 0;
        int cur;
        int max = 0;
        int start;

        unordered_map<char, int> loc;
        loc[str[0]] = 0;
        for (i = 1; i < str.length(); i++) {

            if (loc.find(str[i]) == loc.end())
                loc[str[i]] = i;

            else {
                if (loc[str[i]] >= st) {

                    cur = i - st;
                    if (max < cur) {
                        max = cur;
                        start = st;
                    }

                    st = loc[str[i]] + 1;
                }
                loc[str[i]] = i;
            }
        }

        if (max < i - st) {
            max = i - st;
            start = st;
        }

        ans = str.substr(start, max);
        return ans.size();
    }
};

int main()
{
	string input = "ewafsfdasewcz";
    Solution s;
    cout<<s.lengthOfLongestSubstring(input);
	return 0;
}

/*
Runtime: 32 ms
Memory Usage : 8.7 MB
*/