//
//  MaximumProductSubarray.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/12/20.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 152. Maximum Product Subarray

func maxProduct(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    
    var maxValue = Array(repeating: 0, count: nums.count)
    var minValue = Array(repeating: 0, count: nums.count)
    
    if let firstValue = nums.first {
        maxValue[0] = firstValue
        minValue[0] = firstValue
    }

    var result = nums[0]
    
    for i in 1 ..< nums.count {
        let current = nums[i]
        if current > 0 {
            maxValue[i] = max(maxValue[i - 1] * current, current)
            minValue[i] = min(minValue[i - 1] * current, current)
        } else {
            maxValue[i] = max(minValue[i - 1] * current, current)
            minValue[i] = min(maxValue[i - 1] * current, current)
        }
        
        result = max(maxValue[i], result)
    }
    
    return result
}

print(maxProduct([2,3,-2,4]))
//Input: [2,3,-2,4]
//Output: 6
//Explanation: [2,3] has the largest product 6.

print(maxProduct([-2,0,-1]))
//Input: [-2,0,-1]
//Output: 0
//Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
