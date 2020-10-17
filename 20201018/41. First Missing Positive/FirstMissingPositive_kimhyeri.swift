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
    
    for i in 0..<nums.count {
        // key = 숫자
        // value = 인덱스
        dictionary.updateValue(i, forKey: nums[i])
    }
    
    for i in 1..<Int.max {
        if dictionary[i] == nil {
            answer = i
            break
        }
    }
    
    return answer
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
