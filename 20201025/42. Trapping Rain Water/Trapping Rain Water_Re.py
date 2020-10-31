class Solution:
    def trap(self, height: List[int]) -> int:
        if not height:
            return 0

        result = 0
        left, right = 0, len(height) - 1  # 처음과 끝을 위치로 초기화
        left_max, right_max = height[left], height[right]  # 현재 위치의 값을 max 값으로 초기화

        while left < right:
            left_max, right_max = max(left_max, height[left]), max(right_max, height[right])
            if left_max <= right_max:
                result += left_max - height[left]
                left += 1
            else:
                result += right_max - height[right]
                right -= 1
        return result
