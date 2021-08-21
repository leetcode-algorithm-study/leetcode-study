//
//  Repeated Substring Pattern_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/22.
//

import Foundation

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        for i in stride(from: s.count/2, to: 0, by: -1) {
            let prefixIndex = s.index(s.startIndex, offsetBy: i)
            let suffixIndex = s.index(s.endIndex, offsetBy: -i)

            let prefix = s[..<prefixIndex]
            let suffix = s[suffixIndex...]

            if prefix == suffix {
                let middle = String(s[prefixIndex..<suffixIndex])
                
                if middle.isEmpty {
                    return true
                } else {
                    if middle.replacingOccurrences(of: prefix, with: "").isEmpty {
                        return true
                    }
                }
            }
        }
        return false
    }
}
