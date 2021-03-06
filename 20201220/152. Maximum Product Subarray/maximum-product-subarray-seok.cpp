// 186/187 test passed, but TLE in 187
class Solution {
private:
	void findMax(vector<int>& nums, int initIdx, int subLength, int& maxVal)
	{
		int product = 1;
		int length = subLength + initIdx;
		int productDivided;
		int afterZero = 0;
		
		for (int i = initIdx; i < length; i++)
		{
			if (nums[i] == 0)
			{
				maxVal = max(maxVal, 0);
				if (i + 1 < length)
				{
					product = 1;
					afterZero = i + 1;
				}
				continue;
			}
			product *= nums[i];
			maxVal = max(maxVal, product);
			productDivided = product;
			for (int j = afterZero; j < i; j++)
			{
				productDivided /= nums[j];
				maxVal = max(maxVal, productDivided);
			}
		}
	}
public:
	int maxProduct(vector<int>& nums) {
		int size = nums.size();
		int maxVal = INT_MIN;
		int product = 1;
    
		findMax(nums, 0, size, maxVal);
    
		return maxVal;
	}
};

//Runtime: 0 ms
//Memory Usage: 12.1 MB
class Solution {
private:
	void findMax(vector<int>& nums, int initIdx, int subLength, int& maxVal)
	{
		int product = 1;
		int length = subLength + initIdx;
		int productDivided;
		int afterZero = 0;

		for (int i = initIdx; i < length; i++)
		{
			if (nums[i] == 0)
			{
               			product = 1;
				continue;
			}
			product *= nums[i];
			maxVal = max(maxVal, product);
		}
		product = 1;
		for (int i = length - 1; i >= 0; i--)
		{
			product *= nums[i];
			maxVal = max(maxVal, product);
			if (nums[i] == 0)
			{
				product = 1;
			}
		}
	}
public:
	int maxProduct(vector<int>& nums) {
        if(nums.size()==1) return nums[0];
		int size = nums.size();
		int maxVal = 0;
		int product = 1;
		findMax(nums, 0, size, maxVal);
		return maxVal;
	}
};
