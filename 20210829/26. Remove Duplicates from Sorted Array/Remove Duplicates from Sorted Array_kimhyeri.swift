//
//  Remove Duplicates from Sorted Array_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/29.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var count = nums.count
        var left = 0
        var right = 1
        
        while right < count {
            if nums[left] == nums[right] {
                nums.remove(at: right)
                count = count - 1
            } else {
                left = left + 1
                right = right + 1
            }
        }
        
        return nums.count
    }
}
