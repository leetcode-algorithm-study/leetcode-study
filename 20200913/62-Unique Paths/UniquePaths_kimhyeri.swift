//
//  UniquePaths.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/12.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 62. Unique Paths

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var count = Array(repeating: Array(repeating: 0, count: m), count: n)

    func dfs(x: Int, y: Int, count: inout [[Int]]) -> Int {
        if x > n - 1 || y > m - 1 {
            return 0
        }
        
        if x == n - 1, y == m - 1 {
            return 1
        }
        
        if count[x][y] != 0 {
            return count[x][y]
        }

        let pathCount = dfs(x: x + 1, y: y, count: &count) +
            dfs(x: x, y: y + 1, count: &count)

        count[x][y] = pathCount
        return pathCount
    }

    return dfs(x: 0, y: 0,count: &count)
}

print(uniquePaths(23, 12))
// 193536720

print(uniquePaths(3, 2))
// 3

print(uniquePaths(7, 3))
// 28

// 값 저장 안하면 시간 초과

//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var answer = 0
//
//    func path(x:Int, y: Int) -> Int {
//        if x > n - 1 || y > m - 1 { return 0 }
//        print("\(x) \(y)")
//
//        if x == n - 1, y == m - 1 {
//            return 1
//        }
//        // right (m, n + 1)
//        // down (m + 1, n)
//        return path(x: x, y: y + 1) + path(x: x + 1, y: y)
//    }
//
//    // start
//    answer = path(x: 0, y: 0)
//    return answer
//}
