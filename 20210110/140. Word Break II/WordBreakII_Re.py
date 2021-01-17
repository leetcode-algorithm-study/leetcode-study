s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
def wordBreak(s, wordDict):

    def dfs(i):
        if i == len(s):     #i가 범위를 넘으면
            return [""]
        if i in dic:        #dic안에 i가 있으면,

            return dic[i]

        result = []
        for j in range(i, len(s)):
            prefix = s[i:j + 1]

            if prefix in wordSet:
                tmp = dfs(j + 1)
                for string in tmp:
                    string = prefix + " " + string
                    result.append(string.strip())       #strip는 오른쪽 공백을 지움 , 제일 뒤에 붙는 값은 prefix+" "이므로

        dic[i] = result
        return result

    dic = {}
    wordSet = set(wordDict)
    #wordDict = ["cat", "cats", "and", "sand", "dog"]
    #       ->{"cat", "cats", "and", "sand", "dog"}     ->  검색 시간 단축을 위한 작업
    return dfs(0)

wordBreak(s, wordDict)
