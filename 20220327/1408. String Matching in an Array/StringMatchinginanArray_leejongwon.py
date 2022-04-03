class Solution:
    def stringMatching(self, words: List[str]) -> List[str]:
        result = []
        cache = {}

        for i in range(0, len(words)):
            for j in range(0, len(words)):
                if i == j:
                    continue
                if words[i] in cache:
                    continue
                if len(words[i]) > len(words[j]):
                    continue
                if words[i] in words[j]:
                    result.append(words[i])
                    cache[words[i]] = True
                    break

        return result