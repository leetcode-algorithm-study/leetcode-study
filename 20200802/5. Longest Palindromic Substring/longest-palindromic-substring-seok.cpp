#include <iostream>
#include <string>
using namespace std;

/*
How to approach?
Brute-Force
*/

class Solution {
public:
    string longestPalindrome(string s) {
        int i;
        int prev = 0;
        int next = 0;
        int curLen = 0;
        int maxLen = 0;
        int start = 0;
        bool Isfirst = 0;
        bool Isdone = 0;
        if (s.size() == 1)
        {
            return s;
        }
        for (i = 0; i < s.size(); i++)
        {

            // Step 1. First loop. If there is the same character on both sides, count two more. else if it is the first iteration, just count one.
            curLen = 0;
            prev = i;
            next = i + 1;
            Isfirst = 1;
            while ((prev >= 0 && next < s.size()))
            {
                if (s[prev] == s[next])
                {
                    curLen += 2;
                    Isfirst = 0;
                    prev--;
                    next++;
                }
                else if (Isfirst)
                {
                    curLen = 1;
                    Isfirst = 0;
                    prev--;
                }
                else
                {
                    break;
                }

                if (maxLen < curLen)
                {
                    maxLen = curLen;
                    start = prev + 1;
                }
            }
            // Step 2. Second loop. it is the same condition as above except for the sequence order because of input like "ccc".
            curLen = 0;
            prev = i;
            next = i + 1;
            Isfirst = 1;
            while ((prev >= 0 && next < s.size()))
            {
                if (Isfirst)
                {
                    curLen = 1;
                    Isfirst = 0;
                    prev--;
                }
                else if (s[prev] == s[next])
                {
                    curLen += 2;
                    Isfirst = 0;
                    prev--;
                    next++;
                }
                else
                {
                    break;
                }

                if (maxLen < curLen)
                {
                    maxLen = curLen;
                    start = prev + 1;
                }
            }
        }
        return s.substr(start, maxLen);
    }
};


int main()
{
    string input = "ccc";
    Solution s;
    cout << s.longestPalindrome(input);
    return 0;
}
/*
Runtime: 48 ms, faster than 83.80 % of C++ online submissions for Longest Palindromic Substring.
Memory Usage : 6.6 MB, less than 93.78 % of C++ online submissions for Longest Palindromic Substring.
*/
