class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var answer = [Int]()
        var temp = nums
        
        for i in temp {
            temp.removeFirst()
            answer.append(temp.filter {
                i > $0
            }.count)
        }
        
        return answer
    }
}

// TIME LIMIT
