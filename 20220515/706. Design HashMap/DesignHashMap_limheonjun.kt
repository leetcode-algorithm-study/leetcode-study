import kotlin.math.pow

class MyHashMap() {

    val hashMap = Array<Int>(10.0.pow(6).toInt() + 1){-1}

    fun put(key: Int, value: Int) {
        hashMap[key] = value
    }

    fun get(key: Int): Int {
        return hashMap[key]
    }

    fun remove(key: Int) {
        hashMap[key] = -1
    }

}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * var obj = MyHashMap()
 * obj.put(key,value)
 * var param_2 = obj.get(key)
 * obj.remove(key)
 */