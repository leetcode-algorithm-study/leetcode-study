class Solution:
    def hasAllCodes(self, s: str, k: int) -> bool:
        d = set()

        for i in range(len(s)-k+1):
            ss = s[i:i+k]
            # if ss in d:
            #     continue
            d.add(ss)

        return len(d) == 2**k