class Solution {
public:
    int ladderLength(string beginWord, string endWord, vector<string>& wordList) {
        if( std::find (wordList.begin(), wordList.end(), endWord) == wordList.end() )
            return 0;
        wordList.push_back(beginWord);
        auto retVal = ladderLength2(beginWord, endWord, wordList);
        return retVal == INT_MAX ? 0 : retVal + 1;
    }
    
    int ladderLength2(string beginWord, string endWord, vector<string>& wordList) {
        auto maxCount = wordList.size();
        auto minCount = 0;
        for( auto charIndex = 0; charIndex < beginWord.size(); ++charIndex ) {
            if( beginWord[charIndex] != endWord[charIndex] )
                ++minCount ;
        }
        auto diffStrings = getOneDiffStrings( endWord, wordList );
        auto minRetVal = INT_MAX;
        for( auto& diffString : diffStrings ) {
            if( diffString.compare( beginWord ) == 0 ) return 1;
            wordList.erase( std::find (wordList.begin(), wordList.end(), diffString) );
            auto length = ladderLength2( beginWord, diffString, wordList );
            wordList.push_back(diffString);
            if( length <= maxCount && length < minRetVal )  minRetVal = length + 1;
            if( minRetVal == minCount ) return minRetVal;
        }
        return minRetVal;
    }
    
    vector<string> getOneDiffStrings(string endWord, vector<string>& wordList) {
        vector<string> oneDiffVec;
        for( auto word : wordList ) {
            auto diff = 0;
            for( auto charIndex = 0; charIndex < word.size(); ++charIndex ) {
                if( word[charIndex] != endWord[charIndex] )
                    ++diff;
            }
            if(diff == 1) {
                oneDiffVec.push_back( word );
            }
        }
        return oneDiffVec;
    }
};

// Time Limit Exceeded #22
// "qa"
// "sq"
// ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]
