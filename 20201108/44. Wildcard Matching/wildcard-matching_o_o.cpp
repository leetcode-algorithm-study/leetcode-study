class Solution {
public:
    bool isMatch(string s, string p) {
        int sIndex = 0, pIndex = 0;
        char prevReplaceChar = '?';
        while( pIndex < p.size()  ) {
            if( p[pIndex] == '?' || p[pIndex] == s[sIndex] ) {
                ++pIndex; ++sIndex;
            } else if(p[pIndex] == '*') {
                ++pIndex;
            } else {
                if( pIndex > 0 && p[pIndex - 1] == '*')
                    ++sIndex;
                else
                    return false;
            }
            if( sIndex > s.size() ) return false;
            printf("pIndex %d, sIndex %d \n", pIndex, sIndex);
        }
        
        return sIndex == s.size() || p[p.size() - 1] == '*';
    }
};

// "abcabczzzde"
// "*abc???de*"