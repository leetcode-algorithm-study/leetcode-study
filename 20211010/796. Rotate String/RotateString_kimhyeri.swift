//
//  Rotate String_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/10/4.
//

import Foundation

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        var set = Set<String>()
        var temp = s

        for i in 0..<s.count {
            let first = temp.removeFirst()
            temp.append(first)
            set.insert(temp)
            
            if set.contains(goal) {
                return true
            }
        }
        return false
    }
}
