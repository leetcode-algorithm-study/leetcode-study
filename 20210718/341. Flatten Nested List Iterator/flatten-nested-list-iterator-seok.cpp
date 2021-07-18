//Runtime: 12 ms, faster than 92.73% of C++ online submissions for Flatten Nested List Iterator.
//Memory Usage: 13.1 MB, less than 60.93% of C++ online submissions for Flatten Nested List Iterator.

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *   public:
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     bool isInteger() const;
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     int getInteger() const;
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     const vector<NestedInteger> &getList() const;
 * };
 */

class NestedIterator {
private:
	vector<int> v;
	int idx = 0;
	void initialize(vector<NestedInteger>& nestedList)
	{
		for (int i = 0; i < nestedList.size(); i++)
		{
			if (nestedList[i].isInteger())
			{
				v.push_back(nestedList[i].getInteger());
			}
			else
			{
				initialize(nestedList[i].getList());
			}
		}
	}
public:
	NestedIterator(vector<NestedInteger>& nestedList) {
		initialize(nestedList);
	}

	int next() {
		return v[idx++];
	}

	bool hasNext() {
		int n = v.size();
		return n - idx;
	}
};


/**
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i(nestedList);
 * while (i.hasNext()) cout << i.next();
 */
