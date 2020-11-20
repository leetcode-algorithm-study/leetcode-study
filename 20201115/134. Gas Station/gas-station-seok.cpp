class Solution {
public:
	int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
		int curr = 0;
		int sum = 0;
		int idx = -1;
		bool idxSet = false;

		for (int i = 0; i < gas.size(); i++)
		{
			curr += (gas[i] - cost[i]);
			sum += (gas[i] - cost[i]);
			if (curr < 0)
			{
				curr = 0;
				idxSet = false;
				continue;
			}
			else if (!idxSet)
			{
				idx = i;
				idxSet = true;
			}
		}

		return (sum < 0) ? (-1) : idx;
	}
};

/*
Runtime: 8 ms
Memory Usage: 10.1 MB
*/