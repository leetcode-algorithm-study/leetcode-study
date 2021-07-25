class Solution {
public:
	vector<string> findRepeatedDnaSequences(string s) {
		vector<string> v;
		unordered_map<string, int> m;
		string str;
		for (int i = 0; i < 10; i++)
		{
			str += s[i];
		}
		m[str]++;
		int idx = 10;
		int n = s.size();
		while (idx < n)
		{
			str.erase(str.begin());
			str += s[idx];
			m[str]++;
			if (m[str] == 2)
			{
				v.push_back(str);
			}
            idx++;
		}
		return v;
	}
};
