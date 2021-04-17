class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let nonZero = nums.filter { $0 != 0 }
        let productNonZero = nonZero.reduce(1, *)

        return nums.map {
            if nonZero.count == nums.count {
                return productNonZero / $0
            } else if nonZero.count == nums.count - 1 {
                if $0 == 0 {
                    return productNonZero
                } else {
                    return 0
                }
            } else {
                return 0
            }
        }
    }
}
