class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let filtringNonZero = nums.filter { $0 != 0 }
        let productNonZero = filtringNonZero.reduce(1, *)

        var answer = [Int]()
        
        if filtringNonZero.count == nums.count {
            answer = nums.map { productNonZero / $0 }
        } else if filtringNonZero.count == nums.count - 1 {
            answer = nums.map {
                if $0 == 0 {
                    return productNonZero
                } else {
                    return 0
                }
            }
        } else {
            answer = Array(repeating: 0, count: nums.count)
        }
        
        return answer
    }
}
