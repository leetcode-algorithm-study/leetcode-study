//
//  LargestRectangleinHistogram.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/29.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 84. Largest Rectangle in Histogram

func largestRectangleArea(_ heights: [Int]) -> Int {
    var answer = heights.max()
    var left = 0

    if heights.count == 1 { return heights.first! }
    
    while left < heights.count {
        var minHeight = left
        for i in left + 1..<heights.count {
            // 넓이 높이
            if heights[minHeight] > heights[i] {
                minHeight = i
            }
            let height = heights[minHeight]
            let width = i - left + 1
            let area = height * width
                    
            // 현재 구해진 area가 answer보다 큰 경우
            answer = max(answer ?? 0, area)
        }
        left = left + 1
    }
    
    return answer ?? 0
}

print(largestRectangleArea([0,9]))

print(largestRectangleArea([1,1]))

print(largestRectangleArea([2,1,5,6,2,3]))

//Input: [2,1,5,6,2,3]
//Output: 10
