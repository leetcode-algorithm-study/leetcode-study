class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        
        # 한바퀴 순회하면서 muls 를 구해놓고, 또 한바퀴 순회하면서 각 인덱스 값을 나누려고 했다
        # 첫번쨰 순회때 left 누적 곱밖에 모름
        # 그래서 두번째에 right 순회를 추가함
        
        result = [1] * len(nums)
        acc = 1
        
        for i in range(len(nums)):
            result[i] = acc
            acc *= nums[i]
            
        acc = 1
        for i in range(len(nums)):
            i_rev = len(nums) - i - 1
            result[i_rev] *= acc
            acc *= nums[i_rev]
            
        return result
            
        