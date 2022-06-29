class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for i in 0..<nums.count {
            let complement =  target - nums[i]
            
            if let value = dict[complement] {
                return [i, value]
            } else {
                dict[nums[i]] = i
            }
        }
        
        return [0]
    }
}
