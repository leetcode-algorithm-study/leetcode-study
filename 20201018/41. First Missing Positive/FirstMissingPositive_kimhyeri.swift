//
//  FirstMissingPositive.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/17.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 41. First Missing Positive

func firstMissingPositive(_ nums: [Int]) -> Int {
    var answer = 1
    var dictionary = [Int: Int]()
    
    nums.forEach {
        dictionary.updateValue($0, forKey: $0)
    }

    while true {
        if dictionary[answer] == nil {
            return answer
        } else {
            answer = answer + 1
        }
    }
}

print(firstMissingPositive([1,2,0]))
//Input: [1,2,0]
//Output: 3

print(firstMissingPositive([3,4,-1,1]))
//Input: [3,4,-1,1]
//Output: 2

print(firstMissingPositive([7,8,9,11,12]))
//Input: [7,8,9,11,12]
//Output: 1

//func firstMissingPositive(_ nums: [Int]) -> Int {
//    var answer = 1
//
//    while true {
//        if (nums.contains(answer)) {
//            answer = answer + 1
//        } else {
//            break
//        }
//    }
//    return answer
//}
