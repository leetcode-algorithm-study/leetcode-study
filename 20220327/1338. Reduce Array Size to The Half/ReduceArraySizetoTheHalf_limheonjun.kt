//적어도 배열의 절반이 제거되도록 하는 집합의 최소 크기를 반환
class Solution {
    fun minSetSize(arr: IntArray): Int {
        val map = mutableMapOf<Int, Int>()
        var size = arr.size
        var result = 0
        for(num in arr) {
            map[num] = map.getOrDefault(num, 0)+1
        }

        //집합을 최소 크기로 만들기 위해 가장 많이 나오는 것 순으로 정렬
        val toMap = map.toList().sortedByDescending { it.second }.toMap()

        for(entry in toMap) {
            size -= entry.value
            result++
            if(size <= arr.size/2) {
                break
            }
        }
        return result
    }
}