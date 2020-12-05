class LRUCache {
public:
	unordered_map<int, int> cap;
	unordered_map<int, int>capUsedCnt;
	int idxCnt = 0;
	int capSize = 0;
	int dateCapUsed = 0;
	LRUCache(int capacity) {
		capSize = capacity;
	}

	int get(int key) {
		if (cap.find(key) == cap.end())
		{
			return -1;
		}
		else
		{

			capUsedCnt[key] = ++dateCapUsed;
			return cap[key];
		}
	}
	void put(int key, int value) {
		if (cap.find(key) == cap.end())
		{
			if (idxCnt < capSize)
			{
				++idxCnt;
				cap.insert(pair<int, int>(key, value));
				capUsedCnt.insert(pair<int, int>(key, 0));
			}
			else
			{
				auto minUsedCnt = *min_element(capUsedCnt.begin(), capUsedCnt.end(), [](const auto& lhs, const auto& rhs) {
					return lhs.second < rhs.second; });
				int minUsedKey = minUsedCnt.first;
				cap.erase(minUsedKey);
				capUsedCnt.erase(minUsedKey);
				cap.insert(pair<int, int>(key, value));
				capUsedCnt.insert(pair<int, int>(key, value));
			}
		}
		else
		{
			cap[key] = value;
		}
		capUsedCnt[key] = ++dateCapUsed;
	}
};
//Runtime: 304 ms, faster than 10.13% of C++ online submissions for LRU Cache.
//Memory Usage: 40.2 MB, less than 92.67% of C++ online submissions for LRU Cache.
