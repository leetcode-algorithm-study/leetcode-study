class Solution:
    def climbStairs(self, n: int) -> int:
        num1, num2, ans = 1, 2, 0
        if n <= 2:
            return n
        for i in range(3,n+1):
            ans = num1+num2
            num1 = num2
            num2 = ans

        return ans
        