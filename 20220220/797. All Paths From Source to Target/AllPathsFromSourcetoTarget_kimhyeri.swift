class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var path = [Int]()
        var allPath = [[Int]]()

        func dfs(_ graph: [[Int]], _ source: Int) {
            path.append(source)

            // 마지막 부분
            if source == graph.count - 1 {
                allPath.append(path)
                path.removeLast()
                return
            }

            for negihbor in graph[source] {
                dfs(graph, negihbor)
            }

            path.removeLast()
        }

        dfs(graph, 0)

        return allPath
    }
}
