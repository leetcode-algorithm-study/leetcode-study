// origin is https://github.com/o-oppang/lets-solve-algorithm.git
// Given a string containing digits from 2-9 inclusive,
// return all possible letter combinations that the number could represent.

// A mapping of digit to letters (just like on the telephone buttons) is 
// given below. Note that 1 does not map to any letters.

// static const std::map<int, vector<string>> keyMap = {
//     {2, {"a", "b", "c"} },
//     {3, {"d", "e", "f"} },
//     {4, {"g", "h", "i"} },
//     {5, {"j", "k", "l"} },
//     {6, {"m", "n", "o"} },
//     {7, {"p", "q", "r", "s"} },
//     {8, {"t", "u", "v"} },
//     {9, {"w", "x", "y", "z"} },
// };

class Solution {
public:
    vector<string> letterCombinations(string digits) {
        static const std::map<int, vector<string>> keyMap = {
            {2, {"a", "b", "c"} },
            {3, {"d", "e", "f"} },
            {4, {"g", "h", "i"} },
            {5, {"j", "k", "l"} },
            {6, {"m", "n", "o"} },
            {7, {"p", "q", "r", "s"} },
            {8, {"t", "u", "v"} },
            {9, {"w", "x", "y", "z"} },
        };

        vector<string> combinations = { "" };
        
        for( auto inputIter = 0; inputIter < digits.length(); ++inputIter ) {
            int num = static_cast<int>( digits[inputIter] ) - '0' ;

            auto keyMappingPair = keyMap.find(num);
            if( keyMappingPair == keyMap.end() ) {
                // throw std::runtime_error("unexpected input value");
                break;
            }
            auto keyMappingValues = keyMappingPair->second;

            auto prevCombinations = std::move(combinations);
            for(auto combIter = prevCombinations.begin(); combIter < prevCombinations.end(); ++combIter ) {
                for( auto i = keyMappingValues.begin(); i < keyMappingValues.end(); ++i ) {
                    combinations.push_back( *combIter + *i );
                }
            }
        }
        
        if( combinations.size() == 1 ) {
            combinations.clear();
        }

        return combinations;
    }
};

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Letter Combinations of a Phone Number.
// Memory Usage: 6.7 MB, less than 49.20% of C++ online submissions for Letter Combinations of a Phone Number.
