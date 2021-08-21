//
//  Repeated String Match .swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/22.
//

import Foundation

class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        var count = 1
        var copyA = a
        
        let setA = Set(Array(a))
        let setB = Set(Array(b))
        
        // b가 포함관계에 있어야 함
        if !setB.isSubset(of: setA) {
            return -1
        }
        
        // 기본 세팅
        while copyA.count < b.count {
            copyA.append(a)
            count = count + 1
        }
        
        if copyA.contains(b) {
            return count
        } else {
            copyA.append(a)
            if copyA.contains(b) {
                count = count + 1
                return count
            } else {
                return -1
            }
        }
    }
}
