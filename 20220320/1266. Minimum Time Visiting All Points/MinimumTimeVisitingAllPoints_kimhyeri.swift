class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var answer = 0
        var compare = points.first!

        for i in points {
            if i != compare {
                answer = answer + max(abs(compare.first! - i.first!), abs(compare.last! - i.last!))
                compare = i
            }
        }

        return answer
    }
}
