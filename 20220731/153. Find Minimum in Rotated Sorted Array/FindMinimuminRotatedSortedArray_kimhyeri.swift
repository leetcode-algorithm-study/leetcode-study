class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var nums = nums
        let sorted = nums.sorted()
        
        for i in 0..<nums.count {
            if nums.first! == sorted.first! {
                return nums.first!
            }
            nums.append(nums.removeFirst())
        }
        
        return 0
    }
}
