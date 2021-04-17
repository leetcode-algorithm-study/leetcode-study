#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>
/*
How to access?
it counts the longest substring. When it points the value that is already contained in hash map, set the stack pointer 'st' again and check the maximum condition.
the location of 'st' can be variable depending on whether the contained value is before or after the 'st'.
*/
using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string str) {
	// Declare the variables
        string ans = "";
        int i;
        int st = 0;
        int cur;
        int max = 0;
        int start;
        unordered_map<char, int> loc;
        loc[str[0]] = 0;
        for (i = 1; i < str.length(); i++) {
		//Step 1. If there is no this value in the map, just add. If not, it goes to the second step.
            if (loc.find(str[i]) == loc.end())
                loc[str[i]] = i;
		//Step 2. If the location of value is after 'st', calculate the current length and check if it's maximum length. If not, just only set 'st' again.
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
	//Step 3. Check whether the maximum length.
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
