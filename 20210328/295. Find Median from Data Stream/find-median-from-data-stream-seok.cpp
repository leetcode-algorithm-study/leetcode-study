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