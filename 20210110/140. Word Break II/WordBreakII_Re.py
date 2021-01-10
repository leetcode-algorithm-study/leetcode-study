s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
def wordBreak(s, wordDict):

    def dfs(i):
        if i == len(s):     #i가 범위를 넘으면
            return [""]
        if i in dic:        #dic안에 i가 있으면면

            return dic[i]
        result = []
        for j in range(i, len(s)):
            prefix = s[i:j + 1]

            if prefix in wordSet:
                tmp = dfs(j + 1)
                for string in tmp:
                    string = prefix + " " + string
                    result.append(string.strip())

        dic[i] = result
        print("TL", dic)
        print(result)
        print()
        return result

    dic = {}

    wordSet = set(wordDict)
    return dfs(0)

wordBreak(s, wordDict)
