//
//  SortColors.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/14.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 75. Sort Colors

func sortColors(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    
    var r = 0
    var g = 0
    var b = 0
    
    for i in nums {
        switch i {
        case 0:
            r = r + 1
        case 1:
            g = g + 1
        case 2:
            b = b + 1
        default:
            print("nothing")
        }
    }
    
    nums[0 ..< r] = ArraySlice(repeating: 0, count: r)
    nums[r ..< r + g] = ArraySlice(repeating: 1, count: g)
    nums[r + g ..< r + g + b] = ArraySlice(repeating: 2, count: b)
}

var nums = [2,0,2,1,1,0]
print(sortColors(&nums))
// Output: [0,0,1,1,2,2]

nums = [2,0,1]
print(sortColors(&nums))
// Output: [0,1,2]

nums = [0,1]
print(sortColors(&nums))
// Output: [0,1]

func sortColors(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }

    var r = 0
    var g = 0
    var b = 0

    for i in nums {
        switch i {
        case 0:
            r = r + 1
        case 1:
            g = g + 1
        case 2:
            b = b + 1
        default:
            return
        }
    }

    for i in 0..<nums.count {
        switch i {
        case 0..<r:
            nums[i] = 0
        case r..<r+g:
            nums[i] = 1
        case r+g..<r+g+b:
            nums[i] = 2
        default:
            return
        }
    }
    
    print(nums)
}

var nums = [2,0,2,1,1,0]
print(sortColors(&nums))
// Output: [0,0,1,1,2,2]

nums = [2,0,1]
print(sortColors(&nums))
// Output: [0,1,2]

nums = [0,1]
print(sortColors(&nums))
// Output: [0,1]
