/**
배열에 있는 다른 문자열의 부분 문자열인 문자열들을 반환
*/
class Solution {
    fun stringMatching(words: Array<String>): List<String> {
        val set = words.toSet()
        val result = mutableListOf<String>()
        for (i in words.indices) {
            val substringWord = words[i]
            for(word in set) {
                if(word == substringWord) continue
                if(word.contains(substringWord)) {
                    result.add(substringWord)
                    break
                }
            }
        }
        return result
    }
}