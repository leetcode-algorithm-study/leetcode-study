class Solution {
private:
	void regression(long double x1, long double y1, long double x2, long double y2, long double& a, long double& b, char& lineMode, int& xLine)
	{
		if (x1 == x2 && y1 == y2)
		{
			lineMode = SAMEPOINTS;
		}
		else if (x1 - x2 != 0)
		{
			lineMode = REGULAR;
			a = (y1 - y2) / (x1 - x2);
			b = ((y1 + y2) - (x1 + x2) * a) / 2;
		}
		else
		{
			lineMode = XLINE;
			xLine = x1;
		}
	}
	bool isMatched(int x, int y, long double a, long double b, char& lineMode, int& xLine, int baseX, int baseY)
	{
		bool isTrue = false;
		switch (lineMode)
		{
		case 0: //REGULAR
			isTrue = (a * x + b == y) ? true : false;
			break;
		case 1: // XLINE
			isTrue = (x == xLine) ? true : false;
			break;
		case 2: //SAMEPOINTS
			isTrue = (x == baseX && y == baseY) ? true : false;
			break;
		default:
			break;

		}
		return isTrue;
	}
public:
	int REGULAR = 0;
	int XLINE = 1;
	int SAMEPOINTS = 2;
	int maxPoints(vector<vector<int>>& points) {
		if (points.size() == 0)    return 0;
		if (points.size() == 1)    return 1;
		long double a;
		long double b;
		char lineMode;
		int xLine;
		int cnt = 0;
		int maxCnt = 0;
		for (int i = 0; i < points.size() - 1; i++)
		{
			for (int j = i + 1; j < points.size(); j++)
			{
				regression((long double)points[i][0], (long double)points[i][1], (long double)points[j][0], (long double)points[j][1], a, b, lineMode, xLine);
				cnt = 0;
				for (int k = 0; k < points.size(); k++)
				{
					if (isMatched(points[k][0], points[k][1], a, b, lineMode, xLine, points[i][0],points[i][1]))
					{
						cnt++;
					}
				}
				maxCnt = max(maxCnt, cnt);
			}
		}
		return maxCnt;
	}
};
