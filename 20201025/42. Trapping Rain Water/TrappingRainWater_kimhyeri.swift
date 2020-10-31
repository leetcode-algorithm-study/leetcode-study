//
//  TrappingRainWater.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/31.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 42. Trapping Rain Water

func trap(_ heights: [Int]) -> Int {
    var stack = [Int]()
    var answer = 0
    
    for (index, value) in heights.enumerated() {
        // 스택이 비어있으면 안되고, 이전 높이보다 현재 높이가 더 커야하는 조건
        while !stack.isEmpty, heights[stack.last!] < value {
            // 이전 높이 가져오고 pop
            let top = heights[stack.popLast()!]
            // stack이 비어있으면 공간이 안되니깐
            if stack.isEmpty {
                break
            }
            // 이 이전 높이랑 현재 value랑 비교하고 top은 빼주기
            let height = min(value, heights[stack.last!]) - top
            let width = index - stack.last! - 1
            answer = answer + height * width
        }
        stack.append(index)
    }
    return answer
}

print(trap([2,1,0,1,3]))

//print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))

// Runtime: 36 ms, faster than 25.51% of Swift online submissions for Trapping Rain Water.
// Memory Usage: 14.2 MB, less than 38.78% of Swift online submissions for Trapping Rain Water.
