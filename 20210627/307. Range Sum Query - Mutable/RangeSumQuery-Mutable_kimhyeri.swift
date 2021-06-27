//
//  main.swift
//  Leet
//
//  Created by 김혜리 on 2021/06/20.
//

import Foundation

class NumArray {
    var storage: [Int]
    
    init(_ nums: [Int]) {
        self.storage = nums
    }
    
    func update(_ i: Int, _ val: Int) {
        // 범위 validation check
        guard i >= 0 && i < storage.count else { return }

        storage[i] = val
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        // 범위 validation check
        guard i >= 0 && i < storage.count else { return 0 }
        guard j >= 0 && j < storage.count else { return 0 }
        guard i <= j else { return 0 }
        
        var total = 0
        
        for k in i...j {
            total = total + storage[k]
        }
        return total
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */
