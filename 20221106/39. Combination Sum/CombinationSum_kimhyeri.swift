class Solution {
   func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()

        func generator(_ candidates: [Int], _ start: Int, _ sum: Int, _ list: inout [Int], _ result: inout [[Int]]) {
            if sum > target {
                return
            } else if sum == target {
                result.append(list)
            } else {
                for i in start..<candidates.count {
                    list.append(candidates[i])
                    print("list \(list)")
                    generator(candidates, i, sum + candidates[i], &list, &result)
                    list.removeLast()
                }
            }
        }

        generator(candidates, 0, 0, &temp, &result)
        
        return result
    }
}
// list [2]
// list [2, 2]
// list [2, 2, 2]
// list [2, 2, 2, 2]
// list [2, 2, 2, 3]
// list [2, 2, 2, 6]
// list [2, 2, 2, 7]
// list [2, 2, 3]
// list [2, 2, 6]
// list [2, 2, 7]
// list [2, 3]
// list [2, 3, 3]
// list [2, 3, 6]
// list [2, 3, 7]
// list [2, 6]
// list [2, 7]
// list [3]
// list [3, 3]
// list [3, 3, 3]
// list [3, 3, 6]
// list [3, 3, 7]
// list [3, 6]
// list [3, 7]
// list [6]
// list [6, 6]
// list [6, 7]
// list [7]
