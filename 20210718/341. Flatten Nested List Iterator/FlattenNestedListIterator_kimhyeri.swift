//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    var nums = [Int]()
    
    // 초기화 시 flat하게 만들어버리기
    init(_ nestedList: [NestedInteger]) {
        self.nums = nestedList.flatMap {
            recursive($0)
        }
        print(nums)
    }
    
    func recursive(_ n: NestedInteger) -> [Int] {
        if n.isInteger() {
            // 1개
            return [n.getInteger()]
        } else {
            // 1개 이상
            return n.getList().flatMap { recursive($0) }
        }
    }
    
    func next() -> Int {
        return nums.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !nums.isEmpty
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
