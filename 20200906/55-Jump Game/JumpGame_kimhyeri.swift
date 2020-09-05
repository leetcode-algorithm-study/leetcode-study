//
//  JumpGame.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/05.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 55. Jump Game

func canJump(_ nums: [Int]) -> Bool {
    if nums.count == 1 { return true }

    var nums = nums
    var i = 0
    
    while i < nums.count - 1 {
        let nextIndex = i + nums[i]
        // 도달 가능한 범위
        if nextIndex < nums.count - 1 {
            for j in i ..< nextIndex {
                if nums[j] == 0 {
                    nums[j] = 1
                }
            }
        }
        // 도달 가능한 범위가 아닐 때
        else {
            for j in i ..< nums.count {
                if nums[j] == 0 {
                    nums[j] = 1
                }
            }
        }
        i += 1
    }
    
    return nums.contains(0) ? false : true
}

//print(canJump([3,2,1,0,4]))
//print(canJump([2,3,1,1,4]))
print(canJump([2,0]))
print(canJump([8,2,4,4,4,9,5,2,5,8,8,0,8,6,9,1,1,6,3,5,1,2,6,6,0,4,8,6,0,3,2,8,7,6,5,1,7,0,3,4,8,3,5,9,0,4,0,1,0,5,9,2,0,7,0,2,1,0,8,2,5,1,2,3,9,7,4,7,0,0,1,8,5,6,7,5,1,9,9,3,5,0,7,5]))
