class RandomizedSet {
public:
	set<int> s;
	/** Initialize your data structure here. */
	RandomizedSet() {

	}

	/** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
	bool insert(int val) {
		if (s.find(val) == s.end())
		{
			s.insert(val);
			return true;
		}
		else
		{
			return false;
		}
	}

	/** Removes a value from the set. Returns true if the set contained the specified element. */
	bool remove(int val) {
		if (s.find(val) == s.end())
		{
			return false;
		}
		else
		{
			s.erase(val);
			return true;
		}
	}

	/** Get a random element from the set. */
	int getRandom() {
		int random = rand() % s.size();
		auto it = s.begin();
		int count = 0;
		while (count<random&&it != s.end())
		{
			count++;
			it++;
		}
		return *it;
	}
};
