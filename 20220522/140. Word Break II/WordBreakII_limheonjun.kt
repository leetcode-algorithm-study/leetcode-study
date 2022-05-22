class Solution {
    fun wordBreak(
        s: String,
        wordDict: List<String>
    ): List<String> {
        return dfs(s, wordDict.toSet(), HashMap())
    }

    fun dfs(s: String, dict: Set<String>, memo: MutableMap<String, List<String>>): List<String> {
        if (memo.containsKey(s)) return memo[s]!!
        val result: MutableList<String> = ArrayList()
        if (s.isEmpty()) return result

        for (word in dict) {
            if (!s.startsWith(word)) continue

            val end = word.length
            if (end == s.length) {
                result.add(word)
            } else {
                val sublist = dfs(s.substring(end), dict, memo)
                for (nextWord in sublist) {
                    result.add("$word $nextWord")
                }
            }
        }
        memo[s] = result
        return result
    }
}

/**
s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]

1.
"catsanddog".startWith("cat") => true
end = "cat".length => 3
"catsanddog".length => 10
end == s.length => false
dfs("sanddog", dict, memo)

2.
"sanddog".startWith("sand") => true
end = "sand".length => 4
"sanddog".length => 7
end == s.length => false
dfs("dog", dict, memo)

3.
"dog".startWith("dog") => true
end = "dog".length => 3
"dog".length => 3
end == s.length => true
return ["dog"]

2.
sublist = ["dog"]
return ["sand dog"]

3.
sublist = ["sand dog"]
return ["cat sand dog"]

*/