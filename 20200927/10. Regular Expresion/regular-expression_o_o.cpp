class Solution {
public:
    bool isMatch(string s, string p) {
        int sIndex = 0, pIndex = 0;
        char prevReplaceChar = '.';
        while( sIndex < s.size() ) {
            if( p[pIndex] == '.' || p[pIndex] == s[sIndex] ) {
                ++pIndex; ++sIndex;
            } else if(p[pIndex] == '*') {
                char prev = p[pIndex - 1];
                if( prev == '.' ) {
                    if(prevReplaceChar == '.') prevReplaceChar = s[sIndex++];
                    prev = prevReplaceChar;
                }
                else if( p[pIndex - 1] == s[sIndex] ) 
                    ++sIndex;
                else
                    ++pIndex; prevReplaceChar = '.';
            } else {
                if(p.size() > pIndex + 1 && p[pIndex + 1] == '*')
                    pIndex = pIndex + 2;
                else
                    return false;
            }
            printf("pIndex %d, sIndex %d \n", pIndex, sIndex);
        }
        
        return true;
    }
};