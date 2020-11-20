// {{"a"}} // 회문
// {{"a", "a"}, {"aa"}} // 둘 다 또 회문
// {{"a", "a", "b"}, {"aa", "b"}, {"a", "ab"}, {"aab"}} // 마지막 string 회문인지 검사
// {{"a", "a", "b"}, {"aa", "b"} // 회문 쌍만 남게 된다.


class Solution {
public:
    vector<vector<string>> partition(string s) {
        if( s.size() == 0 ) return {};
        vector<vector<string>> participants;
        participants.push_back({{s[0]}});
        for( auto chIndex = 1; chIndex < s.size(); ++chIndex ) {
            char ch = s[chIndex];
            vector<vector<string>> additionalParticipants;
            for( auto& participant : participants ) {
                // 마지막 string이 회문인 경우, 1) 하나를 카피해서 마지막 string에 append 2) 새로운 string 시작
                if( isPalindrome(participant.back()) ) {
                    vector<string> newString;
                    newString.assign(participant.begin(), participant.end());
                    newString.back().push_back(ch);
                    participant.push_back({ch});
                    additionalParticipants.push_back(newString);
                } else { // 회문이 아닌 경우 마지막 string에 append
                    participant.back().push_back(ch);
                }
            }
            participants.insert(participants.end(), additionalParticipants.begin(), additionalParticipants.end());
        }
        
        vector<vector<string>> retVal;
        for( auto& participant : participants ) {
            if( isPalindrome(participant.back()) ) {       
                retVal.push_back( participant );
            }
        }
        return retVal;
    }
    
private:
    bool isPalindrome(const string& s) {
        auto isPalindrome = true;
        for( auto i = 0; i < s.size() / 2 && isPalindrome; ++i ) {
            if( s[i] != s[s.size() - 1 - i] )
                isPalindrome = false;
        }
        return isPalindrome;
    }
};

// Runtime: 52 ms, faster than 45.28% of C++ online submissions for Palindrome Partitioning.
// Memory Usage: 47.1 MB, less than 28.23% of C++ online submissions for Palindrome Partitioning.