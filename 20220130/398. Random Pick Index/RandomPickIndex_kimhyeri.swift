class Solution {
    var dictionary = [Int: [Int]]()

    init(_ nums: [Int]) {
        for i in 0 ..< nums.count {
            let val = nums[i]
            if var arr = dictionary[val] {
                arr.append(i)
                dictionary[val] = arr
            } else {
                dictionary[val] = [i]
            }
        }
    }
    
    func pick(_ target: Int) -> Int {
        if let arr = dictionary[target] {
            return arr.randomElement() ?? 0
        }
        return 0
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: Int = obj.pick(target)
 */


class Solution {
    var nums = [Int]()
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func pick(_ target: Int) -> Int {
        var random = [Int]()
        
        for i in 0 ..< nums.count {
            if nums[i] == target {
                random.append(i)
            }
        }
        
        return random.randomElement() ?? 0
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: Int = obj.pick(target)
 */
