class ProductOfNumbers {
    var array = [Int]()
    
    init() {
        
    }
    
    func add(_ num: Int) {
        array.append(num)
    }
    
    func getProduct(_ k: Int) -> Int {
        var result = 1
        for i in 0..<k {
            result = result * array[array.count-1-i]
        }
        return result
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */
