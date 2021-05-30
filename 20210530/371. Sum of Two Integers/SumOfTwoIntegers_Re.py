class Solution(object):
    def getSum(self, a, b):
        firstValue = 0xffffffff

        while b:
            sums = (a ^ b) & firstValue  # xor
            carry = ((a & b) << 1) & firstValue  # and
            a = sums
            b = carry

        if (a >> 31) & 1:
            return ~(a ^ firstValue)
        return a

# Runtime: 16 ms, faster than 69.90% of Python online submissions for Sum of Two Integers.
# Memory Usage: 13.5 MB, less than 12.24% of Python online submissions for Sum of Two Integers.