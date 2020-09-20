//
//  MedianofTwoSortedArrays.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/15.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 4. Median of Two Sorted Arrays

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let combine = nums1 + nums2
    let sorted = combine.sorted()
    
    if sorted.count % 2 == 0 {
        let value = Double(sorted[(sorted.count / 2) - 1]) + Double(sorted[sorted.count / 2])
        return value / 2
    } else {
        return Double(sorted[sorted.count / 2])
    }
}

print(findMedianSortedArrays([1,3], [2]))
// 2.0
print(findMedianSortedArrays([1,2], [3,4]))
// 2.5
print(findMedianSortedArrays([0,0], [0,0]))
// 0
