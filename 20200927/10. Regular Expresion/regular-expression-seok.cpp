class Solution {
public:
	string S;
	string P;
	map<string, bool>mem;
	bool recur(int idxS, int idxP)
	{
		string key = S[idxS] + ":" + P[idxP];
		if (mem.find(key) != mem.end())
			return mem[key];
		if (idxP == P.size())
		{
			if (idxS == S.size())
			{
				return true;
			}
			return false;
		}
		bool firstMatch = (idxS < S.size()) && ((S[idxS] == P[idxP]) || (P[idxP] == '.'));
		bool res = false;
		if (idxP + 2 <= P.size() && P[idxP + 1] == '*')
		{
			res = (firstMatch && recur(idxS + 1, idxP)) || (recur(idxS, idxP + 2));
		}
		else
		{
			res |= (firstMatch && recur(idxS + 1, idxP + 1));
		}

		if (mem.find(key) != mem.end())
		{
			mem[key] = res;
		}
		return res;
	}
	bool isMatch(string s, string p) {
		S = s;
		P = p;
		return recur(0, 0);
	}
};
