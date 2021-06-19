//Runtime: 40 ms, faster than 32.72% of C++ online submissions for Grumpy Bookstore Owner.
//Memory Usage: 32.3 MB, less than 15.74% of C++ online submissions for Grumpy Bookstore
class Solution {
public:
	int maxSatisfied(vector<int>& customers, vector<int>& grumpy, int minutes) {
		int n = customers.size();
		int ans = 0;
		int sum = 0;
		for (int i = 0; i < n; i++)
		{
			if (grumpy[i] == 0)
			{
				sum += customers[i];
			}
		}

        int left = 0;
        int right = minutes-1;
        
        queue<bool>q;
        for(int i = left; i<=right; i++)
        {
            q.push(grumpy[i]);
            if(grumpy[i]==1)
            {
                sum+=customers[i];
            }
        }
        ans=max(ans,sum);
        left++;
        right++;
        while(right<n)
        {
            if(grumpy[right]==1)
            {
                sum+=customers[right];
            }
            if(q.front()==1)
            {
                sum-=customers[left-1];
            }
            
            q.pop();
            q.push(grumpy[right]);
            ans=max(ans,sum);
            left++;
            right++;

        }
        
		return ans;
	}
};
