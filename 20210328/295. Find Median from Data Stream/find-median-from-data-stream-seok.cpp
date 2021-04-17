// passed: 16/18
// solving yet

class MedianFinder {
private:
	vector<double> v;
public:
	/** initialize your data structure here. */
	MedianFinder() {
	}

	void addNum(int num) {
		v.push_back(num);
	}

	double findMedian() {
		sort(v.begin(), v.end());
		int medIdx = (v.size() / 2);
		double medVal = v[medIdx];
		if (v.size() % 2 == 0)
		{
			medVal += v[medIdx - 1];
			medVal /= 2;
		}
		return medVal;
	}
};

//referred to the solution
//Runtime: 240 ms, faster than 9.87% of C++ online submissions for Find Median from Data Stream.
//Memory Usage: 46.7 MB, less than 73.94% of C++ online submissions for Find Median from Data Stream.
class MedianFinder {
private:
	vector<int> v;
public:
	/** initialize your data structure here. */
	MedianFinder() {
	}

	void addNum(int num) {
        if(v.empty())
        {
          v.push_back(num);  
        }
        else
        {
            v.insert(lower_bound(v.begin(),v.end(),num),num);
        }
	}

	double findMedian() {
		//sort(v.begin(), v.end());
        int vsize = v.size();
        return (vsize&1?v[vsize/2]:((double)v[vsize/2-1]+v[vsize/2])*0.5);
	}
};
