//
//  DecodeWays.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/26.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 91. Decode Ways

func numDecodings(_ s: String) -> Int {
    
    var store = Array(repeating: 0, count: s.count +  1)

    func decoding() -> Int {
        guard s.first != "0" else {
            return 0
        }
        
        guard s.count > 1 else {
            return 1
        }
        
        var store = Array(repeating: 0, count: s.count +  1)

        if store[s.count] != 0 {
            return store[s.count]
        }

        let endIndex = s.index(s.startIndex, offsetBy: 1)
        let firstTwo = Int(s[s.startIndex...endIndex])

        let s1 = String(s.dropFirst())
        let s2 = String(s1.dropFirst())

        var total = 0
        
        if firstTwo! < 27 {
            total = total + numDecodings(s2)
        }

        total = total + numDecodings(s1)
        store[s.count] = total
     
        return total
    }

    return decoding()
}

print(numDecodings("4757562545844617494555774581341211511296816786586787755257741178599337186486723247528324612117156948"))
// 시간초과

print(numDecodings("226"))
//Input: "226"
//Output: 3
//Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

print(numDecodings("12"))
//Input: "12"
//Output: 2
//Explanation: It could be decoded as "AB" (1 2) or "L" (12).

//'A' -> 1
//'B' -> 2
//'Z' -> 26
