class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s_counter = {}
        t_counter = {}
        

        for s_char in s:
            s_counter[s_char] = s_counter.get(s_char, 0) + 1

        for t_char in t:
            t_counter[t_char] = t_counter.get(t_char, 0) + 1

        # O(s + t)
        return s_counter == t_counter