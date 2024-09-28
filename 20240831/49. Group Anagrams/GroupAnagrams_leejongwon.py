from collections import defaultdict
from typing import List

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        result = defaultdict(list)
        for _str in strs:
            key = ''.join(sorted(_str)) # "aet"
            result[key].append(_str)

        return result.values()


