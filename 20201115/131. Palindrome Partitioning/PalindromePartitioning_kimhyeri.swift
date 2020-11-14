//
//  PalindromePartitioning.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/11.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 131. Palindrome Partitioning

func partition(_ s: String) -> [[String]] {
    var answer = [[String]]()
    var path = [String]()
    dfs(s, &answer, &path, 0)
    return answer
}

private func dfs(_ s: String, _ result: inout [[String]], _ path: inout [String], _ i: Int) {
    if i == s.count {
        result.append(path)
        return
    }
    
    for index in i..<s.count {
        let start = s.index(s.startIndex, offsetBy: i)
        let end = s.index(s.startIndex, offsetBy: index)
        let word = String(s[start...end])
        if word == String(word.reversed()) {
            path.append(word)
            dfs(s, &result, &path, index + 1)
            if !path.isEmpty {
                path.removeLast()
            }
        }
    }
}
