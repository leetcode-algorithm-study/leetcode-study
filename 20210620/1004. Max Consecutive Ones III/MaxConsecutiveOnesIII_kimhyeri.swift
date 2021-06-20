//
//  main.swift
//  Leet
//
//  Created by 김혜리 on 2021/06/20.
//

import Foundation

class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var array = [Int]()
        var answer = 0
        var length = 0
        
        for i in 0..<A.count {
            if A[i] == 0 {
                if K == 0 {
                    length = 0
                    continue
                }
                if array.count < K {
                    array.append(i)
                    length += 1
                }
                else {
                    length = i - array.removeFirst()
                    array.append(i)
                }
            }
            else {
                length += 1
            }
            answer = max(answer, length)
        }
        return answer
    }
}
