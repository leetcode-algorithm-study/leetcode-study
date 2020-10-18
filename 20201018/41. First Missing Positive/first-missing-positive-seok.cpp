/*
주어진 조건: 시간 O(n), 공간 O(1)

<1이 배열에 없는 경우>
1을 리턴

<1이 배열에 있는 경우>
#1. 
사이즈가 1이면 2를 리턴

#2.
배열의 사이즈가 5라고 하자. 
실제 배열의 값들은 [3,2,6,-1,1] 이라고 하자.

이문제는
[1,2,3,4,5] 중에 답이 있게 된다. (공간 제약 있으니까 선언하지 않고 가상으로 생각한다.)

실제 배열에서 5를 넘는 숫자나 음의 숫자는 다 1로 치환하자.
[3,2,6,-1,1] -> [3,2,1,1,1]
로 바뀐다.

해당 배열에 4,5가 없기 때문에 4가 리턴된다. 
*/

class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        bool containOne=false;
        for(auto i:nums)
        {
            if(i==1)
            {
                containOne=true;
                break;
            }
        }
        if(!containOne)
            return 1;
        
        int n=nums.size();
        if(n==1)
            return 2;
        
        for(int i=0;i<n;i++)
        {
            if(nums[i]<=0||nums[i]>n)
                nums[i]=1;
        }
        for(int i=0;i<n;i++)
        {
            int j=abs(nums[i]);
            if(nums[j-1]>0)
                nums[j-1]*=-1;
        }
        for(int i=0;i<n;i++)
        {
            if(nums[i]>0)
                return i+1;
        }
        
        return n+1;
    }
};

/*
Runtime: 4 ms, faster than 78.24% of C++ online submissions for First Missing Positive.
Memory Usage: 9.9 MB, less than 99.99% of C++ online submissions for First Missing Positive.
*/
