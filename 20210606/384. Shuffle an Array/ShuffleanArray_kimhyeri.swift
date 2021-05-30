
class Solution {
    var array = [Int]()

    init(_ nums: [Int]) {
        array = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return array
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        return array.shuffled()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
