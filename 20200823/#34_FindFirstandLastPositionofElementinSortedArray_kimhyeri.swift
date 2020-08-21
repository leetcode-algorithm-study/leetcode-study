//
//  FindFirstandLastPositionofElementinSortedArray.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/16.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 34. Find First and Last Position of Element in Sorted Array
/// Given an array of integers nums sorted in ascending order, find the starting and endign position of a given target value.
/// O(logn)

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var answerArray = [Int]()
    
    if nums.count == 1 , nums.first == target {
        return [0,0]
    }
    
    func binarySearch(array: [Int], start: Int, end: Int) {
        guard start <= end, array.count > 1 else {
            return
        }
        
        let middle = (start + end) / 2
        
//        print("start:\(start), end:\(end), middle:\(middle)")
        if array[middle] == target {
            answerArray.append(middle)
            binarySearch(array: array, start: start, end: middle - 1)
            binarySearch(array: array, start: middle + 1, end: end)
        }
        if array[middle] > target {
            binarySearch(array: array, start: start, end: middle - 1)
        } else {
            binarySearch(array: array, start: middle + 1, end: end)
        }
    }
    
    binarySearch(array: nums, start: 0, end: nums.count - 1)
    answerArray = answerArray.sorted()
    if let first = answerArray.first, let last = answerArray.last {
        answerArray = [first, last]
    }
    return answerArray.isEmpty ? [-1, -1] : answerArray
}

print(searchRange([1,2,2], 2))
// [1,2]

print(searchRange([2,2], 2))
// [0,1]

print(searchRange([1], 1))
// [0,0]

print(searchRange([5,7,7,8,8,10], 8))
// Input: nums = [5,7,7,8,8,10], target = 8
// Output: [3,4]

print(searchRange([5,7,7,8,8,10], 6))
// Input: nums = [5,7,7,8,8,10], target = 6
// Output: [-1,-1]


// Result
// Runtime: 56 ms, faster than 74.85% of Swift online submissions for Find First and Last Position of Element in Sorted Array.
// Memory Usage: 21.6 MB, less than 26.02% of Swift online submissions for Find First and Last Position of Element in Sorted Array.
