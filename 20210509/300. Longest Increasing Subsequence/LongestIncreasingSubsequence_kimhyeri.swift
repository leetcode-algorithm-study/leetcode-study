class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        var tails = [nums[0]]
        var length = 0
        
        for num in nums {
            var left = 0
            var right = tails.count - 1
            var middle = 0
            while left != right {
                middle = (left + right) / 2
                if tails[middle] < num {
                    left = middle + 1
                } else {
                    right = middle
                }
            }
            
            if left == tails.count - 1 && tails[left] < num {
                tails.append(num)
            } else {
                tails[left] = num
            }
        }
        return tails.count
    }
}
