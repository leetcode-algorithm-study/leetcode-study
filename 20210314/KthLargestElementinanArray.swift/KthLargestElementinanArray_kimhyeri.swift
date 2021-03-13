//
//  KthLargestElementinanArray.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/03/14.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 215. Kth Largest Element in an Array

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let reverse = nums.sorted { $0 > $1 }
    return reverse[k - 1]
}

print(findKthLargest([3,2,1,5,6,4], 2))
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
print(findKthLargest([99,99], 1))

//Runtime: 60 ms, faster than 52.54% of Swift online submissions for Kth Largest Element in an Array.
//Memory Usage: 14.6 MB, less than 34.87% of Swift online submissions for Kth Largest Element in an Array.
