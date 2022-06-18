// TLE
class Solution {
    func countArrangement(_ n: Int) -> Int {
        let arr = Array(1...n)
        var permute = [[Int]]()
        var visited = Array(repeating: false, count: arr.count)
        
        func permutation(new: [Int]) {
            if new.count == arr.count {
                permute.append(Array(new))
                return
            } else {
                for i in 0..<arr.count {
                    if visited[i] {
                        continue
                    } else {
                        visited[i] = true
                        permutation(new: new + [arr[i]])
                        visited[i] = false
                    }
                }
            }
        }
        
        permutation(new: [])
        print(permute)
        var ans = [[Int]]()
        
        for perm in permute {
            var okay = true
            for i in 1...perm.count {
                if !(perm[i-1] % i == 0 || i % perm[i-1] == 0) {
                    okay = false
                    break
                }
            }
            if okay {
                ans.append(perm)
            }
        }
        
        return ans.count
    }
}
