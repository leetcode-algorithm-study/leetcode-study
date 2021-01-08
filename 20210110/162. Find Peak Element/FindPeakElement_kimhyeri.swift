//
//  FindPeakElement.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/08.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 162. Find Peak Element

func findPeakElement(_ nums: [Int]) -> Int {
    var index = 0
    let end = nums.count - 1
    
    if nums.count == 1 {
        return index
    } else if nums.count == 2 {
        if nums[index] < nums[index + 1] {
            return index + 1
        }
    }
    
    for i in 1 ..< end {
        let left = i - 1
        let right = i + 1
        let now = nums[i]
        
        if now > nums[left], now > nums[right], now > nums[index], now > nums[end] {
            index = i
        }
    }
    
    // 끝을 못잡아 낼때 사용
    if nums[index] > nums[end] {
        return index
    } else {
        return end
    }
}

print(findPeakElement([1,2,3]))

print(findPeakElement([1]))

print(findPeakElement([1,2,3,1]))
//Input: nums = [1,2,3,1]
//Output: 2
//Explanation: 3 is a peak element and your function should return the index number 2.

print(findPeakElement([1,2,1,3,5,6,4]))
//Input: nums = [1,2,1,3,5,6,4]
//Output: 5
//Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
