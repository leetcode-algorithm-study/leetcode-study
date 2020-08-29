//
//  Permutations.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/26.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 46. Permutations
func permute(_ nums: [Int]) -> [[Int]] {
    func generatePermutation(from: [Int], to: [Int], set: inout Set<[Int]>) {
        if to.count >= nums.count {
            set.insert(to)
        }
        if !from.isEmpty {
            for (index, item) in from.enumerated() {
                var newFrom = from
                newFrom.remove(at: index)
                generatePermutation(from: newFrom,
                                    to: to + [item],
                                    set: &set
                )
            }
        }
    }
    
    var set = Set<[Int]>()
    generatePermutation(from: nums, to: [], set: &set)
    return set.map{ $0 }
}

print(permute([1,2,3]))

//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]

// Result
// Runtime: 28 ms, faster than 58.10% of Swift online submissions for Permutations.
// Memory Usage: 22.9 MB, less than 5.28% of Swift online submissions for Permutations.
