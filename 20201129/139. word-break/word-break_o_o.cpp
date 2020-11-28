class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        vector<bool> wordBreak( s.size() + 1, false );
        wordBreak[0] = true;
        for( auto i = 1; i < wordBreak.size(); ++i ) {
            for( auto j = 0; j < i; ++j ) {
                if( wordBreak[j] && 
                    std::find(wordDict.begin(), wordDict.end(), s.substr(j, i-j)) != wordDict.end()) {
                    wordBreak[i] = true;
                    break;
                }
            }
        }
        return wordBreak.back();
    }
};