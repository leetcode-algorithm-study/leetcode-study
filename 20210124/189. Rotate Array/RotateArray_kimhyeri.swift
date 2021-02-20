//
//  RotateArray.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/24.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 189. Rotate Array

func rotate(_ nums: inout [Int], _ k: Int) {
    for _ in 0..<k {
        var end = nums[nums.count - 1]
        for i in stride(from:nums.count - 1, to: 0, by: -1) {
            var temp = nums[i - 1]
            nums[i] = temp
        }
        nums[0] = end
    }
}

print(rotate([1,2,3,4,5,6,7], 3))
//Input: nums = [1,2,3,4,5,6,7], k = 3
//Output: [5,6,7,1,2,3,4]
//Explanation:
//rotate 1 steps to the right: [7,1,2,3,4,5,6]
//rotate 2 steps to the right: [6,7,1,2,3,4,5]
//rotate 3 steps to the right: [5,6,7,1,2,3,4]

print(rotate([-1,-100,3,99], 2))
//Input: nums = [-1,-100,3,99], k = 2
//Output: [3,99,-1,-100]
//Explanation:
//rotate 1 steps to the right: [99,-1,-100,3]
//rotate 2 steps to the right: [3,99,-1,-100]


// Time Limit
