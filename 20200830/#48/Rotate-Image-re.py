from copy import deepcopy
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        m=deepcopy(matrix)
        length = len(m)
        for r in range(length):
            for c in range(length):
                matrix[c][length-(r+1)] = m[r][c]
        return matrix
