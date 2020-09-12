//
//  MergeIntervals.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/12.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 56. Merge Intervals

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return [[Int]]() }
    
    var answer = [[Int]]()

    let sorted = intervals.sorted { $0[0] < $1[0] }
    answer.append(sorted.first!)

    for index in 1 ..< sorted.count {
        let start = answer.last![0]
        let end = answer.last![1]
        let nextS = sorted[index][0]
        let nextE = sorted[index][1]

        // 겹치는 부분이 있을 떄
        if end >= nextS, end <= nextE {
            answer.removeLast()
            answer.append([start, nextE])
        }
        // 겹치는 부분이 없을 때
        else if end < nextE {
            answer.append([nextS, nextE])
        }
    }
    return answer
}
//print(merge([[2,3],[4,5],[6,7],[8,9],[1,10]]))
//Output: [[1,10]]

print(merge([[1,4],[5,6]]))
//Output: [[1,4],[5,6]]

print(merge([[1,3],[2,6],[8,10],[15,18]]))
//Output: [[1,6],[8,10],[15,18]]

print(merge([[1,4],[4,5]]))
//Output: [[1,5]]

print(merge([[1,4],[0,2],[3,5]]))
//Output: [[0,5]]

print(merge([[1,4],[0,0]]))
//Output: [[0,0],[1,4]]

print(merge([[1,4],[0,1]]))
//Output: [[0,4]]

print(merge([[1,4],[0,4]]))
//Output: [[0,4]]
