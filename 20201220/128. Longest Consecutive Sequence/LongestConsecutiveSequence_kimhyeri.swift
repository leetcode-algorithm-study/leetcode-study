//
//  LongestConsecutiveSequence.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/12/20.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 128. Longest Consecutive Sequence

func longestConsecutive(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    var count = 0

    let numSet = Set(nums)
    var set = Set<Int>()

    for num in nums {
        if set.contains(num) { continue }

        var length = 1
        var prev = num - 1
        var next = num + 1

        set.insert(num)

        while numSet.contains(prev) {
            set.insert(prev)
            length = length + 1
            prev = prev - 1
        }

        while numSet.contains(next) {
            set.insert(next)
            length = length + 1
            next = next + 1
        }

        if count < length {
            count = length
        }
    }
    
    return count
}

print(longestConsecutive([100,4,200,1,3,2]))
//Output: 4

print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
//Output: 9
