// TLE
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var first = 0
        var second = 1
        var set = Set<[Int]>()

        while first < sorted.count - 2 {
            while second < sorted.count - 1 {
                let sum = sorted[first] + sorted[second]
                print("\(sorted[first]) \(sorted[second])")

                if sorted.contains(-sum) {
                    for i in second+1..<sorted.count {
                        if sorted[i] == -sum {
                            set.insert([sorted[first], sorted[second], sorted[i]].sorted())
                        }
                    }
                }

                second = second + 1
            }
            first = first + 1
            second = first + 1
        }

        return set.map{$0}
    }
}

