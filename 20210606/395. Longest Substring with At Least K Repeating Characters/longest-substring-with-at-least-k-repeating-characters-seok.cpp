class Solution {
public:
	int longestSubstring(string s, int k) {
		int result = 0;
		int n = s.size();
		vector<int> v(26, 0);
		for (int i = 0; i < n; i++)
		{
			v[s[i] - 'a']++;
		}

		bool valid = true;
		int start = 0;
		for (int end = 0; end < n; end++)
		{
			if (v[s[end] - 'a'] < k && v[s[end] - 'a'] > 0)
			{
				int nextStart = end + 1;
				while ( nextStart < n &&v[s[nextStart] - 'a'] < k)
				{
					nextStart++;
				}
				valid = false;
				string a = s.substr(start, end);
				string b = s.substr(nextStart, n);
				return max(longestSubstring(a, k), longestSubstring(b, k));
			}
		}
        
        return n;
	}
};
