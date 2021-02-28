// on solving

class Solution {
public:
	vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {
		sort(buildings.begin(), buildings.end(), [](vector<int>a, vector<int>b) {return a[0] < b[0]; });
		int front = buildings.front()[0];
		int back = buildings.back()[1];
		
		vector<vector<int>> skyLine;
		vector<int> topList(buildings.size());
		int maxHeight;
		bool checkedX = false;
		int prev_i;
		int prevHeight;

		for (int x = front; x <= back; x++)
		{
			for (int i = 0; i < buildings.size(); i++)
			{
				if (x < buildings[i][0])
				{
					break;
				}
				else if (x == buildings[i][0])
				{
					if (checkedX)
					{
						if (prevHeight == buildings[i][2])
						{
							skyLine.pop_back();
							continue;
						}
					}
					maxHeight = *max_element(topList.begin(),topList.end());
					topList[i] = buildings[i][2];
					if (buildings[i][2] > maxHeight)
					{
						skyLine.push_back(vector<int>{x,buildings[i][2]});
					}
				}
				else if (x == buildings[i][1])
				{
					maxHeight = *max_element(topList.begin(), topList.end());
					topList[i] = 0;
					if (buildings[i][2] >= maxHeight)
					{					
						maxHeight = *max_element(topList.begin(), topList.end());
						skyLine.push_back(vector<int>{x, maxHeight});
						checkedX = true;
						prev_i = i;
						prevHeight = buildings[i][2];
					}			
				}
			}
		}

		return skyLine;
	}
};
