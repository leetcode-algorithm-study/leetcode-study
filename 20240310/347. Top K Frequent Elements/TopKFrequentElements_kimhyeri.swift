class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()

        for i in nums {
            if let value = dict[i] {
                dict.updateValue(value + 1, forKey: i)
            } else {
                dict[i] = 1
            }
        }

        let sortedByValue = dict.sorted { $0.value > $1.value }
        return Array(sortedByValue.map{$0.key}[..<k])
    }
}