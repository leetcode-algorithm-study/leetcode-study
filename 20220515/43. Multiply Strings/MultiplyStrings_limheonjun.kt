import kotlin.math.abs
import kotlin.math.pow

const val ZERO = "0"

class Solution {

    fun multiply(num1: String, num2: String): String {
        if(isZero(num1) || isZero(num2)) {
            return ZERO
        }

        var result = Array(getResultArraySize(num1, num2)){0}

        for(i in num1.indices) {
            for(j in num2.indices) {
                result[i+j] += convertCharToInt(num1[i]) * convertCharToInt(num2[j])
            }
        }

        for(i in result.size-1 downTo 1) {
            result[i-1] += getCarry(result[i])
            result[i] = getRest(result[i])
        }

        val sb = StringBuilder()
        result.forEach { sb.append(it) }

        return sb.toString()
    }

    fun isZero(num: String): Boolean = ZERO == num
    fun convertCharToInt(char: Char): Int = char-'0'
    fun getResultArraySize(num1: String, num2: String): Int = num1.length + num2.length - 1
    fun getCarry(num: Int): Int = num/10
    fun getRest(num: Int): Int = num%10
}
/**
 * 123 * 456
 *
 * 0    1        2        3     4
 *
 * 4   5+8   6+10+12    12+15    18
 *
 * 4   13       28        27     18
 *
 * 4  13  28  28  8
 * 4  13  30  8  8
 * 4  16  0  8  8
 * 5  6  0 8  8
 */