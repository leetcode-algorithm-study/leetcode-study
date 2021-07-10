//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var path = [Int]()
        let nums = nums.sorted()

        dfs(res: &answer, &path, nums, 0)

        return answer
    }
    
    func dfs(res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
        res.append(path)

        for i in index..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] && i != index {
                continue
            }

            path.append(nums[i])
            dfs(res: &res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}
