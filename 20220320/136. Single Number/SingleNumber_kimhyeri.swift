class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        
        for i in nums {
            if let value = dict[i] {
                dict[i] = value + 1
            } else {
                dict[i] = 1
            }
        }

        let filtered = dict.filter { $0.value == 1 }.first
        return filtered!.key
    }
}
