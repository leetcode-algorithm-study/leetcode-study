//Runtime: 4 ms, faster than 70.54% of C++ online submissions for Peeking Iterator.
//Memory Usage: 7.5 MB, less than 28.28% of C++ online submissions for Peeking Iterator.

/*
 * Below is the interface for Iterator, which is already defined for you.
 * **DO NOT** modify the interface for Iterator.
 *
 *  class Iterator {
 *		struct Data;
 * 		Data* data;
 *  public:
 *		Iterator(const vector<int>& nums);
 * 		Iterator(const Iterator& iter);
 *
 * 		// Returns the next element in the iteration.
 *		int next();
 *
 *		// Returns true if the iteration has more elements.
 *		bool hasNext() const;
 *	};
 */

class PeekingIterator : public Iterator {
private:
	int currVal;
	bool hasNextIdx;
public:
	PeekingIterator(const vector<int>& nums) : Iterator(nums) {
		// Initialize any member here.
		// **DO NOT** save a copy of nums and manipulate it directly.
		// You should only use the Iterator interface methods.
		hasNextIdx = Iterator::hasNext();
        if(hasNextIdx)
        {
            currVal = Iterator::next();
        }
	}

	// Returns the next element in the iteration without advancing the iterator.
	int peek() {
		return currVal;
	}

	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	int next() {
		int val = currVal;
        
		hasNextIdx = Iterator::hasNext();
        if(hasNextIdx)
        {
            currVal = Iterator::next();
        }

		return val;
	}

	bool hasNext() const {
		return hasNextIdx;
	}
};
