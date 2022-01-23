class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var answer = [[Int]]()
        var arr = Array(1...n)
        
        func combination(select: Int, current: Int, selected: [Int]) {
            if select == 0 {
                answer.append(selected)
            } else if current == arr.count {
                return
            } else {
                var new = selected
                new.append(arr[current])
                
                combination(select: select - 1,
                            current: current + 1,
                            selected: new)
                combination(select: select,
                            current: current + 1,
                            selected: selected)
            }
        }
        
        combination(select: k, current: 0, selected: [])
        
        return answer
    }
}
