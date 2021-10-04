//
//  Implement strStr()_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/10/4.
//

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count == 0 && needle.count == 0 { return 0 }

        var temp = haystack
        
        for i in 0..<haystack.count {
            if temp.hasPrefix(needle) {
                return i
            } else {
                temp.removeFirst()
            }
        }
        return -1
    }
}
