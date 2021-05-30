
class RandomizedSet {

    var set: Set<Int> = Set<Int>()
    
    /** Initialize your data structure here. */
    init() {
        set = Set<Int>()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
       if set.contains(val) {
           return false
       } else {
           set.insert(val)
           return true
       }
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
           set.remove(val)
            return true
        } else {
           return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        set.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
