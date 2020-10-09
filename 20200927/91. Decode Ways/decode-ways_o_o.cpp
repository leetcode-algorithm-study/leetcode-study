class Solution {
private:
    string s;
    map<int, int> decodingMap{};
    
public:
    int numDecodings(string s) {
        this->s = s;
        decodingMap.clear();
        return numDecodings(s.size());
    }
    
    int numDecodings( int tail ) {
        if( s[0]=='0' ) return 0;
        if( tail == 0 || tail == 1) return 1; 
        
        if(decodingMap.find( tail ) != decodingMap.end()) { 
            return decodingMap[tail]; }
        
        int numOfDecodings = 0;
        if( s[tail - 1] > '0' ) 
           numOfDecodings += numDecodings( tail - 1 );
        
        if (s[tail - 2] == '1' ||  (s[tail - 2] == '2' && s[tail - 1] < '7') ) {
            numOfDecodings += numDecodings( tail - 2 );
        }
        decodingMap[tail] = numOfDecodings;
        
        return numOfDecodings;
    }
};

// Runtime: 8 ms, faster than 18.68% of C++ online submissions for Decode Ways.
// Memory Usage: 7.3 MB, less than 16.96% of C++ online submissions for Decode Ways.