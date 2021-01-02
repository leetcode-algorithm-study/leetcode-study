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
    if nums.isEmpty {
        return 0
    }
    
    var result = nums.first!
    var set = Set<Int>()
    
    nums.forEach { num in
        if num > result {
            result = num
        }
        
        var tempset = Set<Int>()
        
        set.forEach { i in
            let newValue = i * num
            if newValue > result {
                result = num
            }
            tempset.insert(newValue)
        }
        tempset.insert(num)
        set = tempset
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


print(maxProduct([2,3,-2,4]))
//Input: [2,3,-2,4]
//Output: 6
//Explanation: [2,3] has the largest product 6.

print(maxProduct([-2,0,-1]))
//Input: [-2,0,-1]
//Output: 0
//Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
