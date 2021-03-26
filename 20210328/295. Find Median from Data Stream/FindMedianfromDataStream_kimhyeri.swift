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
        array = [Int]()
    }
    
    func addNum(_ num: Int) {
        if array.count == 0 {
            array.append(num)
        } else {
            var lo = 0
            var hi = array.count
            while lo < hi {
                let mid = (lo + hi)/2
                
                if num >= array[mid] && (mid+1 >= array.count || num <= array[mid+1]) {
                    array.insert(num, at: mid+1)
                    break
                }
                else if num <= array[mid] && (mid-1 < 0 || num >= array[mid-1]) {
                    array.insert(num, at: mid)
                    break
                }
                else if num > array[mid] {
                    lo = mid
                }
                else if num < array[mid] {
                    hi = mid
                }
            }
        }
    }
    
    func findMedian() -> Double {
        // 짝수일 때
        if array.count % 2 == 0 {
            var half = array.count / 2
            var sum = array[half - 1] + array[half]
            return Double(sum) / 2.0
        }
        // 홀수일 때 사용
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
