
class MapSum {
    var dictionary: [String: Int]
    
    init() {
        dictionary = [String: Int]()
    }
    
    func insert(_ key: String, _ val: Int) {
        dictionary[key] = val
    }
    
    func sum(_ prefix: String) -> Int {
        var count = 0
        
        for (key, value) in dictionary {
            if key.hasPrefix(prefix) {
                count = count + value
            }
        }
        
        return count
    }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */
