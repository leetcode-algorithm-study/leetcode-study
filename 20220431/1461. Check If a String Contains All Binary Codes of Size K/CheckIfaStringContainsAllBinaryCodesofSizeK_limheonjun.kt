import kotlin.math.pow

class Solution {
    fun hasAllCodes(s: String, k: Int): Boolean {
        val set = mutableSetOf<String>()

        var start = 0;
        var end = k;

        while(end <= s.length) {
            val substring = s.substring(start++, end++)
            set.add(substring)
        }

        return set.size == ((2.0).pow(k)).toInt()
    }
}