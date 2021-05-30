class Solution(object):
    def getSum(self, a, b):

        firstValue = 0xffffffff

        while b:
            sums = (a ^ b) & firstValue  # xor
            carry = ((a & b) << 1) & firstValue  # and
            a = sums
            b = carry

        if (a >> 31) & 1:       #음수인 경우
            return ~(a ^ firstValue)
        return a

# Runtime: 16 ms, faster than 69.90% of Python online submissions for Sum of Two Integers.
# Memory Usage: 13.5 MB, less than 12.24% of Python online submissions for Sum of Two Integers.



# 2   3
# 10  11                                                  111(7)   010(2)  \  101(5)   100(4) \  1001(9)
#
# ->  01      xor
# -> 100      and carry 1 왼쪽
# ------->    101(5)