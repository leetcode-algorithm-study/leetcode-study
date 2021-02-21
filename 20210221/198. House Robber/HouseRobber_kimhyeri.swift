//
//  HouseRobber.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/02/21.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 198. House Robber

func rob(_ nums: [Int]) -> Int {
    var sum1 = 0
    var sum2 = 0
    
    for i in 0..<nums.count {
        if i % 2 == 0 {
            sum1 = max(sum1 + nums[i], sum2)
        } else {
            sum2 = max(sum2 + nums[i], sum1)
        }
    }
    
    return max(sum1, sum2)
}

print(rob([1,2,3,1]))
// 4
print(rob([2,7,9,3,1]))
// 12
print(rob([2,1,1,2]))
// 4
