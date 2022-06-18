class Solution {
    func countArrangement(_ n: Int) -> Int {
        var count = 0
        var visited = Array(repeating: false, count: n+1)

        func permutation(new: Int) {
            if new > n {
                count = count + 1
                return
            } else {
                for i in 1...n {
                    if visited[i] {
                        continue
                    }
                    else if (new % i == 0 || i % new == 0) {
                        visited[i] = true
                        permutation(new: new+1)
                        visited[i] = false
                    }
                }
            }
        }

        permutation(new: 1)

        return count
    }
}

// TLE
class Solution {
    func countArrangement(_ n: Int) -> Int {
        let arr = Array(1...n)
        var permute = [[Int]]()
        var visited = Array(repeating: false, count: arr.count)

        func permutation(new: [Int]) {
            if new.count == arr.count {
                var okay = true
                for i in 1...new.count {
                    if !(new[i-1] % i == 0 || i % new[i-1] == 0) {
                        okay = false
                        break
                    }
                }
                if okay {
                    permute.append(Array(new))
                }
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
        
        return permute.count
    }
}

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
