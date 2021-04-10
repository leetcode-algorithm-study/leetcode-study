/*
How to approach
주어진 리스트에 target값과 동일한 부분이 있으면 바로 return 해주었다.
*/

#include <iostream>
#include <vector>

using namespace std;

class Solution {
public:
	int search(vector<int>& nums, int target) {
		for (int i=0;i<nums.size();i++)
		{
			if (nums[i] == target)
			{
				return i;
			}
		}
		return -1;
	}
};

int main()
{
	vector<int>v{ 4,5,6,7,0,1,2 };
	int target = 0;
	Solution s;
	cout<<s.search(v, target);
	return 0;
}

/*
Runtime: 8 ms, faster than 69.90% of C++ online submissions for Search in Rotated Sorted Array.
Memory Usage: 11.1 MB, less than 93.34% of C++ online submissions for Search in Rotated Sorted Array.
*/
