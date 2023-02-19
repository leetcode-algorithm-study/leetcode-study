class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var dictionary = [Int:[Int]]()
        
        var visited = [Int](repeating: 0, count: numCourses)
        
        func dfs(_ dictionary: [Int:[Int]], _ index: Int) -> Bool {
            if visited[index] == 1 {
                return false
            }
            
            if visited[index] == 2 {
                return true
            }
            
            visited[index] = 1
            
            for neighbor in dictionary[index] ?? [] {
                guard dfs(dictionary, neighbor) else {
                    return false
                }
            }
            visited[index] = 2
            
            return true
        }
        
        for prereq in prerequisites {
            dictionary[prereq[0], default: []].append(prereq[1])
        }
        
        print(dictionary)
        
        
        for index in 0..<numCourses {
            guard dfs(dictionary,index) else {
                return false
            }
        }
        
        return true
    }
}
