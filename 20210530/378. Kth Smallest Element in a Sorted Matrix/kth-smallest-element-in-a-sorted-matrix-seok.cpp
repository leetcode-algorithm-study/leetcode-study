class Solution {
public:
    int kthSmallest(vector<vector<int>>& matrix, int k) {
        int ans = 0;
        priority_queue<int, vector<int>, greater<int>> pq;
        for (int i = 0; i < matrix.size(); i++)
        {
            for (int j = 0; j < matrix[i].size(); j++)
            {
                pq.push(matrix[i][j]);
            }
        }
        while (k--)
        {
            ans = pq.top();
            pq.pop();
        }
        return ans;
    }
};