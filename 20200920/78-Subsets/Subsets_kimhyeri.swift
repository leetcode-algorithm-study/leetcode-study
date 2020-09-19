//
//  Subsets.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/19.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 78. Subsets

func subsets(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return [[]]
    }

    var copy = nums

    let head = nums[0]

    copy.removeFirst()
    let last = subsets(copy)
    let current = last.map { [head] + $0 }
    return last + current
}

// Runtime: 12 ms, faster than 84.24% of Swift online submissions for Subsets.
// Memory Usage: 21.4 MB, less than 18.23% of Swift online submissions for Subsets.
