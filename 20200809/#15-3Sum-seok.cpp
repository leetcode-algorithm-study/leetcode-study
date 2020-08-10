#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

/* How to approach?
최초 DFS로 O(n^3) 시도하였으나 시간초과 발생
-> vector<pair<int,int>>를 통해 DFS 내에서 예외처리 시도하였으나 역시 n^3으로 시간초과
-> 풀이 실패 후, 구글링 통하여 sort + double indexing으로 O(N*logN) + O(N^2) 풀이 참고
최초에 sort 후, 현재 결과 값 기준으로 두번째와 세번째 인덱싱 포인터를 조절하여 0값으로 수렴하게 유도
*/


class Solution {
public:
	vector<vector<int>> threeSum(vector<int>& nums) {
		vector<int> input = nums;
		vector<vector<int>> ans;
		vector<int> res;
		sort(input.begin(), input.end());

		int i;
		int j;
		int k;
		int base = 0;
		for (i = 0; i < input.size(); i++)
		{
			if (i != 0 && input[i - 1] == input[i])
			{
				continue;
			}			
			base = -input[i];
			j = i + 1;
			k = input.size() - 1;

			while (j<k)
			{
				if (base == (input[j] + input[k]))
				{
					vector<int>res{ input[i],input[j],input[k] };
					ans.push_back(res);
					j++;
					while (input[j - 1] == input[j])
					{
						j++;
					}
					k--;
					while (input[k + 1] == input[k])
					{
						k--;
					}

				}
				else if(base> input[j]+input[k])
				{
					j++;
				}
				else
				{
					k--;
				}
			}
		}
		return ans;
	}
};

int main()
{
	Solution s;
	vector<int> input{ -2, 0, 3, -1, 4, 0, 3, 4, 1, 1, 1, -3, -5, 4, 0 };
	s.threeSum(input);

	return 0;
}

/*
Runtime: 92 ms, faster than 83.37% of C++ online submissions for 3Sum.
Memory Usage: 21.4 MB, less than 41.16% of C++ online submissions for 3Sum.
*/
