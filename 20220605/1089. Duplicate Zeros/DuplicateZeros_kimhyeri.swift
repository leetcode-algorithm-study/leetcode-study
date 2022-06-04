class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var count = 0, index = 0
        
        for i in arr {
            if arr[index] == 0 {
                arr.insert(0, at: index)
                count += 1
                index += 2
            } else {
                index += 1
            }
        }
        
        for i in 0..<count {
            arr.removeLast()
        }
    }
}
