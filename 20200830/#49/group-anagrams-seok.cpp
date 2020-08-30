/*
How to approach?

sort the string value → make the same key → the origin pushed to the map

example)
strs = {"eat","tea","tan","ate","nat","bat"};
map<string, <vector<string>> =  { {"abt", { "bat"} },
				  {"aet", { "eat", "tea", "ate" } },
				  {"ant", { "tan", "nat" } }
				};
*/

class Solution {
public:
   	map<string, vector<string>> MyMap;
	vector<vector<string>> groupAnagrams(vector<string>& input) {
		vector<vector<string>> answer;
		for (auto i:input)
		{
			string key = i;
			sort(key.begin(), key.end());
			MyMap[key].push_back(i);
		}
		map < string, vector<string>>::iterator iter;
		for (iter = MyMap.begin(); iter != MyMap.end(); iter++)
		{
			answer.push_back(iter->second);
		}
		return answer;
	}
};
/*
Runtime: 76 ms, faster than 69.47% of C++ online submissions for Group Anagrams.
Memory Usage: 19.6 MB, less than 70.92% of C++ online submissions for Group Anagrams.
*?
