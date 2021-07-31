//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        var temp = ""
        var letters = ["a", "b", "c"]
        var answer = [String]()
        
        func dfs(_ temp: String) {
            if temp.count == n {
                answer.append(temp)
                return
            } else {
                for i in 0..<letters.count {
                    if temp.count == 0 {
                        var cur = temp + letters[i]
                        dfs(cur)
                    } else {
                        var char = letters[i]
                        if char != String(temp.last!) {
                            var cur = temp + char
                            dfs(cur)
                        }
                    }
                }
            }
        }
        dfs(temp)
        
        if answer.count < k {
            return ""
        } else {
            return answer[k-1]
        }
    }
}
