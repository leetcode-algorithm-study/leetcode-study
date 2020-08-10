/*
How to approach?
최초 O(n^2)으로 실패
-> Double Indexing 시도
물의 부피를 맞출 때 높은 기둥을 기준으로 하여 인덱싱 포인터를 조절하여 성공
*/

class Solution {
public:
	int maxArea(vector<int>& height) {
		int max = 0;
		int len;
		int heightLower = 0;
		int area = 0;
		int left = 0;
		int right = height.size() - 1;
		bool LEFT = false;
		bool RIGHT = true;
		bool changeSide = 0;

		while (left<right)
		{
			len = right - left;
			if (height[left] > height[right])
			{
				heightLower = height[right];
				changeSide = RIGHT;
			}
			else
			{
				heightLower = height[left];
				changeSide = LEFT;
			}
			area = len * heightLower;
			if (area > max)
			{
				max = area;
			}

			if (changeSide)
			{
				right--;
			}
			else
			{
				left++;
			}
		}

		return max;
	}
};

/*
Runtime: 24 ms
Memory Usage: 14.4 MB
*/
