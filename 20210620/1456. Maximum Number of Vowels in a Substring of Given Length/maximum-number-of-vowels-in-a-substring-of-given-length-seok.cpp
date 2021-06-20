//Runtime: 36 ms, faster than 25.89% of C++ online submissions for Maximum Number of Vowels in a Substring of Given Length.
//Memory Usage: 11.1 MB, less than 5.36% of C++ online submissions for Maximum Number of Vowels in a Substring of Given Length.

class Solution {
private:
    bool isVowel(char c)
    {
        if(c=='a'||c=='e'||c=='i'||c=='o'||c=='u')
        {
            return true;
        }
        else
        {
            return false;
        }
    }
public:
    int maxVowels(string s, int k) {
        int n= s.size();
        int left = 0;
        int right = k-1;
        int maxCnt = 0;
        int cnt = 0;
        queue<bool> q;
        for(int i = left; i<=right;i++)
        {
            if(isVowel(s[i]))
            {
                q.push(true);
                cnt++;
            }
            else
            {
                q.push(false);
            }
            
        }
        maxCnt = max(maxCnt, cnt);
        left++;
        right++;
        
        while(right<n)
        {
            if(isVowel(s[right]))
            {
                q.push(true);
                cnt++;
            }
            else
            {
                q.push(false);
            }
            if(q.front())
            {
                cnt--;
            }
            maxCnt = max(maxCnt,cnt);
            
            q.pop();
            left++;
            right++;
        }
        
        return maxCnt;
    }
};
