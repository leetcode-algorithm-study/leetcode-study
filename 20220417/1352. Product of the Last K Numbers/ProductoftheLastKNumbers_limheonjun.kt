class ProductOfNumbers() {
    
    val numbers = mutableListOf<Int>()

    fun add(num: Int) {
        numbers.add(num)
    }

    fun getProduct(k: Int): Int {
        var mul = 1
        for(i in numbers.size-k .. numbers.size-1) {
            mul *= numbers[i]
        }
        return mul
    }

}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * var obj = ProductOfNumbers()
 * obj.add(num)
 * var param_2 = obj.getProduct(k)
 */