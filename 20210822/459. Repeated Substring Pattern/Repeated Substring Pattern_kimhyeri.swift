//
//  Repeated Substring Pattern_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/22.
//

import Foundation

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        var start = 0
        var arr = Array(s)
        
        // TLE벗어나려는 발악/.../
        if arr.count == 1 { 
            return false 
        }
        
        if (Set(arr).count == 1) { 
            return true 
        }
        
        for i in 1...s.count / 2 {
            if arr[0] == arr[i] {
                start = i
            } else {
                break
            }
        }
        
        for i in stride(from: s.count/2, to: start, by: -1) {
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
