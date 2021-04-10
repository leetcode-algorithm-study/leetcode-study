#include <iostream>
#include <string>
#include <unordered_map>
using namespace std;

/*
How to approach?
just compare every condition of the test cases.
*/

class Solution {
public:
    int myAtoi(string s) {
        int arr[1000];
        memset(arr, -1, sizeof(arr));
        int idx = 0;
        signed long tmp = 0;
        signed int ans = 0;
        int conv = 1;
        bool digitContained = false;
        bool Isnegative = false;
        bool Ispositive = false;
        bool zeroContained = false;
        bool Isfirst = true;
        bool Isoverflow = false;
        for (int i = 0; i < s.size(); i++)
        {
            if (s[i] == '0')
            {
                if (Isfirst)
                {
                    if (!zeroContained)
                    {
                        arr[++idx] = s[i] - '0';
                        zeroContained = true;
                        Isfirst = false;
                        continue;
                    }
                    else if (zeroContained)
                    {
                        continue;
                    }
                }
                else
                {
                    if (digitContained)
                    {
                        arr[++idx] = s[i] - '0';
                    }
                }
            }
            else if (s[i] >= '1' && s[i] <= '9')
            {
                digitContained = true;
                if (Isfirst)
                {
                    Isfirst = false;
                }
                arr[++idx] = s[i] - '0';
            }
            else if (s[i] == '-' && Isfirst)
            {
                if (!(s[i + 1] >= '0' && s[i + 1] <= '9'))
                {
                    break;
                }
                Isnegative = true;
            }
            else if (s[i] == '+' && Isfirst)
            {
                if (!(s[i + 1] >= '0' && s[i + 1] <= '9'))
                {
                    break;
                }
                continue;
            }
            else if (s[i] == ' ')
            {
                if (!Isfirst)
                {
                    break;
                }
                continue;
            }
            else
            {
                break;
            }
        }


        if ((idx == 10 && arr[1] >= 3) || idx > 10)
        {
            tmp = 2147483649;
            Isoverflow = true;
        }
        idx = 1;
        Isfirst = true;
        while (arr[idx] != -1 && !Isoverflow)
        {
            tmp *= 10;
            if (Isfirst)
            {
                tmp = 0;
                Isfirst = false;
            }
            tmp += arr[idx];

            idx++;
        }
        if (Isnegative)
        {
            tmp *= -1;
        }
        if (tmp > INT_MAX)
        {
            return INT_MAX;
        }
        else if (tmp < INT_MIN)
        {
            return INT_MIN;
        }
        ans = (signed int)tmp;
        return ans;
    }
};



int main()
{
    string input = "1234";
    Solution s;
	cout << s.myAtoi(input);
	return 0;
}

/*
Runtime: 0 ms, faster than 100.00% of C++ online submissions for String to Integer (atoi).
Memory Usage: 6.2 MB, less than 68.35% of C++ online submissions for String to Integer (atoi).
*/
