//
//  3Sum.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/07.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 15. 3Sum

func threeSum(_ nums: [Int]) -> [[Int]] {
    var answer = [[Int]]()
    var set = Set<[Int]>()
    var temp = nums.sorted()
    
    while temp.count > 2 {
        let goal = temp.removeFirst()
        var left = 0
        var right = temp.count - 1
        
        while left < right {
            if goal > temp[left] + temp[right] {
                break
            } else {
                let sum = goal + temp[left] + temp[right]
                if sum > 0 {
                    right = right - 1
                } else if sum < 0 {
                    left = left + 1
                } else {
                    set.insert([goal, temp[left], temp[right]])
                    right = right - 1
                    left = left + 1
                }
            }
        }
    }
    
    set.forEach({
        answer.append($0)
    })
   
    return answer
}

print(threeSum([3,0,3,2,-4,0,-3,2,2,0,-1,-5]))

print(threeSum([-2,0,1,1,2]))

print(threeSum([3,-2,1,0]))

print(threeSum([-1,0,1,2,-1,-4]))

// Result
// Runtime: 812 ms, faster than 33.81% of Swift online submissions for 3Sum.
// Memory Usage: 24.9 MB, less than 18.77% of Swift online submissions for 3Sum.

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    var answer = [[Int]]()
//    var set = Set<[Int]>()
//    var temp = nums
//
//    while temp.count > 2 {
//        let goal = temp.removeFirst()
//        let sorted = temp.sorted()
//
//        var left = 0
//        var right = sorted.count - 1
//
//        while left < right {
//            if goal + sorted[left] + sorted[right] > 0 {
//                right = right - 1
//            } else if goal + sorted[left] + sorted[right] < 0 {
//                left = left + 1
//            } else {
//                set.insert([goal, sorted[left], sorted[right]].sorted())
//                right = right - 1
//                left = left + 1
//            }
//        }
//    }
//
//    set.forEach({
//        answer.append($0)
//    })
//
//    return answer
//}

// 시간 초과

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    var answer = [[Int]]()
//    var set = Set<[Int]>()
//    var temp = nums
//
//    while !temp.isEmpty {
//        let goal = temp.removeFirst()
//
//        for i in 0..<temp.count {
//            let first = temp[i]
//            for j in i+1..<temp.count {
//                let second = temp[j]
//
//                if goal + first + second == 0 {
//                    let array = [goal, first, second].sorted()
//                    set.insert(array)
//                }
//            }
//        }
//    }
//
//    set.forEach({
//        answer.append($0)
//    })
//
//    return answer
//}
//
//print(threeSum([-1, 0, 1, 2, -1, -4]))

// 시간초과
