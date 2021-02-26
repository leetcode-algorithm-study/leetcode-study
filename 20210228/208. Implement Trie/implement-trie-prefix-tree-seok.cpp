//Runtime: 876 ms, faster than 5.17 % of C++ online submissions for Implement Trie(Prefix Tree).
//Memory Usage : 70.3 MB, less than 8.60 % of C++ online submissions for Implement Trie(Prefix Tree).

class Trie {
private:
	vector<string> v;
public:
	/** Initialize your data structure here. */
	Trie() {

	}

	/** Inserts a word into the trie. */
	void insert(string word) {
		v.push_back(word);
	}

	/** Returns if the word is in the trie. */
	bool search(string word) {
		for (auto i : v)
		{
			if (i == word)
			{
				return true;
			}
		}
		return false;
	}

	/** Returns if there is any word in the trie that starts with the given prefix. */
	bool startsWith(string prefix) {
		bool pass = false;
		for (int i = 0; i < v.size(); i++)
		{
			pass = false;
			for (int j = 0; j < prefix.size(); j++)
			{
				if (v[i][j] != prefix[j])
				{
					pass = false;
					break;
				}
				else
				{
					pass = true;
				}
			}
			if (pass)
			{
				return true;
			}
		}
		return false;
	}
};
