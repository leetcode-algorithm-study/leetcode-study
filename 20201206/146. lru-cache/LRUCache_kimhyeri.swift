//
//  LRUCache.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/12/04.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 146. LRU Cache

class LRUCache {
    var dictionary = [Int: Int]()
    var order = [Int]()
    var capacity = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    // O(1)
    func get(_ key: Int) -> Int {
        // 해당 인덱스 찾아서 다시 앞으로 가져옴
        if let value = dictionary[key], let index = order.firstIndex(of: key) {
            let find = order.remove(at: index)
            order.insert(find, at: 0)
            return value
        } else {
            return -1
        }
    }
    
    // O(1)
    func put(_ key: Int, _ value: Int) {
        if let _ = dictionary[key], let index = order.firstIndex(of: key) {
            // 해당 인덱스 찾아서 다시 앞으로 가져옴
            let find = order.remove(at: index)
            order.insert(find, at: 0)
            dictionary.updateValue(value, forKey: key)
            return
        }
        
        if order.count == capacity {
            // 최근에 가장 적게 사용한 곳 정리
            // 가장 마지막 것은 최근에 사용하지 않았다고 판단
            let removingKey = order.removeLast()
            dictionary.removeValue(forKey: removingKey)
        }
        // 항상 맨 첫번 째에 넣기
        order.insert(key, at: 0)
        dictionary.updateValue(value, forKey: key)
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

let obj2 = LRUCache(2)
print(obj2.get(2))
obj2.put(2, 6)
print(obj2.get(1))
obj2.put(1, 5)
obj2.put(1, 2)
print(obj2.get(1))
print(obj2.get(2))

//["LRUCache","get","put","get","put","put","get","get"]
//[[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
// -1,-1,2,6

let obj1 = LRUCache(1)
obj1.put(2, 1)
print(obj1.get(2))

//["LRUCache","put","get"]
//[[1],[2,1],[2]]
// 1

let obj = LRUCache(2) // nil
obj.put(1, 1) // nil
obj.put(2, 2) // nil
print(obj.get(1)) // 1
obj.put(3, 3) // nil
print(obj.get(2)) // -1
obj.put(4, 4) // nil
print(obj.get(1)) // -1
print(obj.get(3)) // 3
print(obj.get(4)) // 4

//Input
//["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//Output
//[null, null, null, 1, null, -1, null, -1, 3, 4]

