/**
 * Given an array of strings, group anagrams together.
 * 
 * Example:
 * 
 * Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 * Output:
 * [
 *   ["ate","eat","tea"],
 *   ["nat","tan"],
 *   ["bat"]
 * ]
 * Note:
 * 
 * All inputs will be in lowercase.
 * The order of your output does not matter.
 */

class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        std::map<string, vector<string>> anagramsMap;
        for( auto str = strs.begin(); str < strs.end(); ++str ) {
            auto key = *str;
            sort(key.begin(), key.end(), less<int>());
            anagramsMap[key].push_back( *str );
        }

        std::vector<vector<string>> retVal;
        for(auto it = anagramsMap.cbegin(); it != anagramsMap.cend(); ++it)
        {
            retVal.push_back(it->second);
        }

        return retVal;
    }
};

// Runtime: 72 ms, faster than 76.08% of C++ online submissions for Group Anagrams.
// Memory Usage: 19.3 MB, less than 83.60% of C++ online submissions for Group Anagrams.