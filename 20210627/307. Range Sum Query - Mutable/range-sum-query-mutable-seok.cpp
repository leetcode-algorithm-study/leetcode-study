//Runtime: 396 ms, faster than 48.50% of C++ online submissions for Range Sum Query - Mutable.
//Memory Usage: 153.2 MB, less than 23.22% of C++ online submissions for Range Sum Query -

class NumArray {
private:
	vector<int> ref;
	vector<int> v;
	int n;
	int init(vector<int>& nums, int left, int right, int idx)
	{
		if (left == right)
		{
			return v[idx] = nums[left];
		}
		int mid = (left + right) / 2;
		int initLeft = init(nums, left, mid, idx*2);
		int initRight = init(nums, mid + 1, right,(idx*2)+1);
		return v[idx] = initLeft + initRight;
	}
	void updateLocal(int index, int diff, int left, int right, int idx)
	{
		if (index >= left && index <= right)
		{
			v[idx] += diff;
			if (left == right)
			{
				return;
			}
			int mid = (left + right) / 2;
			updateLocal(index, diff, left, mid, idx * 2);
			updateLocal(index, diff, mid + 1, right, idx * 2 + 1);
		}
	}
	int sumRangeLocal(int left, int right, int start, int end, int idx)
	{
		if (left > end || right < start)
		{
			return 0;
		}
		else if (left <= start&& end <= right)
		{
			return v[idx];
		}
		else
		{
			int mid = (start + end) / 2;
			return sumRangeLocal(left, right, start, mid, idx * 2) + sumRangeLocal(left,right,mid+1,end,idx*2+1);
		}
	}
public:
	NumArray(vector<int>& nums) {
		ref = nums;
		n = nums.size();
		v.resize(n * 4);
		init(nums, 0, n - 1,1);
	}

	void update(int index, int val) {
		int diff = val - ref[index];
		updateLocal(index, diff, 0, n-1,1);
        ref[index] = val;
	}

	int sumRange(int left, int right) {
		return sumRangeLocal(left, right, 0,n-1,1);
	}
};
