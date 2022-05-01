# TLE
# class Solution:
# 	def hasAllCodes(self, s: str, k: int) -> bool:
# 		nums = 2 ** k

# 		for j in range(0, nums):
# 			b = bin(j)[2:]
# 			while len(j) != k:
# 				b = "0" + b
# 			if b not in s:
# 				return False
# 		return True

class Solution:
    def hasAllCodes(self, s, k):
        codes = set()
        for i in range(k, len(s)+1):
            codes.add(s[i-k:i])    
        return len(codes) == 2**k