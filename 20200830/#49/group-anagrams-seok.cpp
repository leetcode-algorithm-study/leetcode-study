class Solution {
public:
    map<string, vector<string>> MyMap;
	vector<vector<string>> groupAnagrams(vector<string>& input) {
		vector<vector<string>> answer;
		for (int i = 0; i < input.size(); i++)
		{
			string key = input[i];
			sort(key.begin(), key.end());
			MyMap[key].push_back(input[i]);
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
Runtime: 72 ms
Memory Usage: 16.6 MB
*?
