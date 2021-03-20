//
//  SlidingWindowMaximum.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/03/14.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 239. Sliding Window Maximum

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int](repeatElement(0, count: nums.count - k + 1))
    var index = 0
    var slidingWindow = [Int]()

    for i in 0..<nums.count {
        while !slidingWindow.isEmpty && slidingWindow.first! < i - k + 1 {
            slidingWindow.removeFirst()
        }
        
        while !slidingWindow.isEmpty && nums[slidingWindow.last!] < nums[i] {
            slidingWindow.removeLast()
        }
        
        slidingWindow.append(i)
        
        if i >= k - 1 {
            result[index] = nums[slidingWindow.first!]
            index = index + 1
        }
    }

    return result
}

// func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//     var answer = [Int]()

//     for i in 0...nums.count - k {
//         let myRange: Range = i..<i+k
//         let newArray = nums[myRange]
//         if let max = newArray.max() {
//             answer.append(max)
//         }
//     }
    
//     return answer
// }

print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindow([1], 1))
print(maxSlidingWindow([1,-1], 1))
print(maxSlidingWindow([9,11], 2))
print(maxSlidingWindow([4,-2], 2))

