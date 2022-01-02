class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var answer = [Int]()
        var arr = Array(1...n)
        var cases = [[Int]]()
        
        // Permutation 구하기
        func permutaion(indexes:[Int], current:Int, pickCount:Int, visited:[Bool], picked:[Int]) {
            let initialVisited = visited.isEmpty ? Array(repeating: false, count: indexes.count) : visited
            if current == pickCount {
                cases.append(picked)
                return
            }
            indexes
                .enumerated()
                .forEach{
                    if !initialVisited[$0.offset] {
                        var newVisited = initialVisited
                        newVisited[$0.offset] = true
                        var newPicked = picked
                        newPicked.append($0.element)
                        permutaion(indexes: indexes, current: current+1, pickCount: pickCount,visited: newVisited,picked: newPicked)
                    }
                }
        }
        permutaion(indexes: arr, current: 0, pickCount: n, visited:[], picked: [])
        print(cases)
        
        for i in cases {
            var myString = ""
            i.map{ myString = myString + "\($0)" }
            if let myInt = Int(myString) {
                answer.append(myInt)
            }
        }
        
        answer.sort()
        return String(answer[k-1])
    }
}
