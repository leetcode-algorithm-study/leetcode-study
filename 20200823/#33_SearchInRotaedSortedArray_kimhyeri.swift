//
//  SearchInRotaedSortedArray.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/18.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// #33 Search in Rotated Sorted Array
/// must be in the  order of O(log n)

func search(_ nums: [Int], _ target: Int) -> Int {
    var index = 0
    
    for i in nums {
        if i == target {
            return index
        } else {
            index = index + 1
        }
    }
    return -1
}

print(search([4,5,6,7,0,1,2], 0))
// output 4

print(search([4,5,6,7,0,1,2], 3))
// output -1


// Result
// Runtime: 28 ms, faster than 26.22% of Swift online submissions for Search in Rotated Sorted Array.
// Memory Usage: 20.9 MB, less than 68.93% of Swift online submissions for Search in Rotated Sorted Array.
