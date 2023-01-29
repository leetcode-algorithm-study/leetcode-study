class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 3 else { return nums.max() ?? 0 }
        var temp = Array(nums.dropFirst())

        for i in 2..<temp.count {
            let maxValue = temp[0...i-2].max()!
            temp[i] = temp[i] + maxValue
        }

        let first = temp.max()

        temp = nums.dropLast()

        for i in 2..<temp.count {
            let maxValue = temp[0...i-2].max()!
            temp[i] = temp[i] + maxValue
        }

        let second = temp.max()

        return max(first ?? 0, second ?? 0)
    }
}
