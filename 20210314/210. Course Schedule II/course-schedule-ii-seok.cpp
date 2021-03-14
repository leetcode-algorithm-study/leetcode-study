//Runtime: 16 ms
//Memory Usage: 13.8 MB

class Solution {
private:
    bool getOrder(vector<vector<int>>& course, int idx, vector<int>& visit, vector<int>& order)
    {
        if(visit[idx]==1)   return false;
        if(visit[idx]==2)   return true;
        visit[idx]=1;
        for(int i=0;i<course[idx].size();i++)
        {
            if(!getOrder(course,course[idx][i],visit,order))    return false;
        }
        visit[idx]=2;
        order.push_back(idx);
        return true;
    }
public:
    vector<int> findOrder(int numCourses, vector<vector<int>>& prerequisites) {
        vector<vector<int>> course(numCourses);
        for(int i=0;i<prerequisites.size();i++)
        {
            int next = prerequisites[i][0];
            int prev = prerequisites[i][1];
            course[next].push_back(prev);
        }
        
        vector<int> visit(numCourses);
        vector<int> order;
        for(int i=0;i<numCourses;i++)
        {
            if(!getOrder(course,i,visit,order))  
            {
                return {};
            }
        }
        return order;
    }
};
