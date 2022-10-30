class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        # cache = [[-1 for _ in range(len(text2) + 1)] for _ in range (len(text1) + 1)]
        return self.helper(text1, text2, 0, 0)

    def helper(self, text1: str, text2: str, i: int, j: int) -> int:
        if len(text1) == i or len(text2) == j:
            return 0
        elif text1[i] == text2[j]:
            return self.helper(text1, text2, i+1, j+1) + 1
        else:
            return max(
                self.helper(text1, text2, i+1, j),
                self.helper(text1, text2, i, j+1)
            )




#                     (abc, b)
#                         1
#             (ab, b)            (abc, '')
#                1                   0
#     (a, b)          (ab, '')
#        0                0
# ('', b) (a, '')
#   0        0




#                                   (abcde, ace)

#              (abcd, ace)                                 (abcde, ac)

#      (abc, ace)         (abcd, ac)              (abcd, ac)          (abcde, a)

# (ab, ace)  (abc, ac) (abc, ac) (abcd, a)    (abc, ac) (abcd, a)   (abcd, a) (abcde, '')

