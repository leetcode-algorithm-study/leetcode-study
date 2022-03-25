class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        let set = Set(arr)
        var answer = 0
        var dict = [Int: Int]()

        if set.count == 1 {
            return 1
        } else {
            for i in arr {
                if let value = dict[i] {
                    dict[i] = value + 1
                } else {
                    dict[i] = 1
                }
            }

            var sum = 0
            let order = dict.sorted{ $0.value > $1.value }

            for (key, value) in order {
                 if arr.count/2 <= sum {
                    return answer
                } else {
                    answer = answer + 1
                }
                sum = sum + value
            }
            return answer
        }
    }
}
