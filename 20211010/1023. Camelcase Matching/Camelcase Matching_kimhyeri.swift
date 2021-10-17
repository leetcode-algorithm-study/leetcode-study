//
//  CamelcaseMatching_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/10/4.
//

import Foundation

class Solution {
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        var answer =  [Bool]()
        let patternArray = Array(pattern)

        for query in queries {
            var index = 0
            var isMatching = true

            for char in query {
                if index < patternArray.count && char == patternArray[index] {
                    index = index + 1
                } else if char.isUppercase {
                    isMatching = false
                    break
                }
            }
            isMatching = isMatching && index == patternArray.count
            answer.append(isMatching)
        }

        return answer
    }
}
