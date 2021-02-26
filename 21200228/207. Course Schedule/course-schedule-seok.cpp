//Runtime: 12 ms, faster than 99.68 % of C++ online submissions for Course Schedule.
//Memory Usage : 13.3 MB, less than 85.04 % of C++ online submissions for Course Schedule.

class Solution {
private:
	bool dfs(vector<vector<int>>& course, int idx, vector<bool>& preList, vector<bool>& history) {
		if (preList[idx])  return false;
		if (history[idx])   return true;
		history[idx] = true;
		preList[idx] = true;

		for (int i = 0; i < course[idx].size(); i++)
		{
			if (!dfs(course, course[idx][i], preList, history))    return false;

		}

		preList[idx] = false;
		return true;
	}
public:
	bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
		vector<vector<int>> course(numCourses);
		for (int i = 0; i < prerequisites.size(); i++)
		{
			int next = prerequisites[i][0];
			int prev = prerequisites[i][1];

			course[next].push_back(prev);
		}

		vector<bool> preList(numCourses, false);
		vector<bool> history(numCourses, false);
		for (int i = 0; i < course.size(); i++)
		{
			if (history[i] == true)	continue;
			if (!dfs(course, i, preList, history))  return false;
		}

		return true;
	}
};