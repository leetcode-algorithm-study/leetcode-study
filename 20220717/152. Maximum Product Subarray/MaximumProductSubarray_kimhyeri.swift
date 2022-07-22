// O(n^2) TLE
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var answer = nums.max() ?? 0
    
        for i in 0..<nums.count {
            for j in i..<nums.count {
                answer = max(answer, nums[i...j].reduce(1, *))
            }
        }
        
        return answer
    }
}

