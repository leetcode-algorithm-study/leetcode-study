class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        let sortedElements = dict.sorted { $0.value > $1.value }
                                .prefix(k)
                                .map { $0.key }
        
        return sortedElements
    }
}