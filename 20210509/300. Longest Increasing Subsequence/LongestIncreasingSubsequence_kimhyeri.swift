class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        var array = [nums.first!]
        var length = 0
        
        for num in nums {
            var left = 0
            var right = array.count - 1
            var middle = 0
            
            while left != right {
                middle = (left + right) / 2
                if array[middle] < num {
                    left = middle + 1
                } else {
                    right = middle
                }
            }
            
            if left == array.count - 1 && array[left] < num {
                array.append(num)
            } else {
                array[left] = num
            }
        }
        
        print(array)
        
        return array.count
    }
}
