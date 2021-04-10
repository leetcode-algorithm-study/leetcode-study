//
//  ContainerWithMostWater.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/02.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 11. ContainerWithMostWater

func maxArea(_ height: [Int]) -> Int {
    var answer = 0
    var left = 0
    var right = height.count - 1

    while left < right {
        let minHeight = min(height[left], height[right])
        let witdh = right - left
        let area = witdh * minHeight

        answer = max(answer, area)

        if minHeight == height[left] {
            left = left + 1
        } else {
            right = right - 1
        }
    }

    return answer
}

// Result
// Runtime: 108 ms, faster than 72.41% of Swift online submissions for Container With Most Water.
// Memory Usage: 21.2 MB, less than 82.35% of Swift online submissions for Container With Most Water.

//func maxArea(_ height: [Int]) -> Int {
//    var answer = 0
//
//    for i in 0..<height.count - 1 {
//        for j in i+1..<height.count {
//            let w = abs(i - j)
//            let h = min(height[i], height[j])
//            if answer < w * h {
//                answer = w * h
//            }
//        }
//    }
//
//    return answer
//}

// 시간초과로 실패

//func maxArea(_ height: [Int]) -> Int {
//    var dictionary = [Int: Int]()
//    var answer = 0
//    var sum = 0
//
//    for i in 0..<height.count {
//        dictionary.updateValue(height[i], forKey: i)
//        sum = sum + height[i]
//    }
//
//    let array = dictionary.sorted { $0.1 > $1.1 }
//    print(array)
//    print(sum / height.count)
//
//    for i in 0..<array.count - 1 {
//        for j in i+1..<array.count {
//            let w = abs(array[i].key - array[j].key)
//            let h = array[j].value
//            if answer < w * h {
//                answer = w * h
//            }
//        }
//    }
//    return answer
//}

// 시간초과로 실패
