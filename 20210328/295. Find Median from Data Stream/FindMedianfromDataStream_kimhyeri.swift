//
//  FindMedianfromDataStream.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/03/25.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 295. Find Median from Data Stream

class MedianFinder {

    /** initialize your data structure here. */
    var array: [Int]
    
    init() {
        // doing something
        array = [Int]()
    }
    
    func addNum(_ num: Int) {
        array.append(num)
        array.sort()
    }
    
    func findMedian() -> Double {
        if array.count % 2 == 0 {
            var half = array.count / 2
            var sum = array[half - 1] + array[half]
            return Double(sum) / 2.0
        }
        else {
            var half = array.count / 2
            return Double(array[half])
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
