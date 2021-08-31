//
//  4Sum_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/29.
//

import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var answer = Set<[Int]>()
        
        guard nums.count >= 4 else { return [] }
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                
                var k = j + 1
                var o = nums.count - 1
                
                while(k < o) {
                    let sum = nums[i]+nums[j]+nums[k]+nums[o]

                    if sum == target {
                        answer.insert([nums[i],nums[j],nums[k],nums[o]])
                        k = k + 1
                        o = o - 1
                    } else if sum > target {
                        o = o - 1
                    } else {
                        k = k + 1
                    }
                }
            }
        }
        return Array(answer)
    }
}
