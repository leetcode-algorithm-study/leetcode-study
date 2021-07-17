//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    private var array: [Int] = []
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.array = Array(arr)
    }
    
    func next() -> Int {
        return array.removeFirst()
    }
    
    func peek() -> Int {
        return array.first ?? 0
    }
    
    func hasNext() -> Bool {
        return !array.isEmpty
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */
