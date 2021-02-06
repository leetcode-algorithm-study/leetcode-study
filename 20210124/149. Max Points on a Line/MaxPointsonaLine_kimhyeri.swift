//
//  MaxPointsonaLine.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/31.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 149. Max Points on a Line

func maxPoints(_ points: [[Int]]) -> Int {
    var answer = 0
    let set = Set(points.map { $0 })
    var temp = set
    
    print(set)
    // 상하좌우 x +- 1 / y +- 1
    // 대각선 x +- 1 y +- 1

    func findMore(x: Int, y: Int) {
        // 대각선
        if temp.contains([x + 1, y + 1]) {
            temp.remove([x, y])
            answer = answer + 1
            findMore(x: x + 1, y: y + 1)
        }
        if temp.contains([x - 1, y - 1]) {
            temp.remove([x, y])
            answer = answer + 1
            findMore(x: x - 1, y: y - 1)
        }
        return
    }
    
    func findAMore(x: Int, y: Int) {
        // 대각선
        if temp.contains([x + 1, y - 1]) {
            temp.remove([x, y])
            answer = answer + 1
            findAMore(x: x + 1, y: y - 1)
        }
        if temp.contains([x - 1, y + 1]) {
            temp.remove([x, y])
            answer = answer + 1
            findAMore(x: x - 1, y: y + 1)
        }
        return
    }
    
    for i in points {
        let x = i.first!
        let y = i.last!
        
        // 대각선
        findAMore(x: x, y: y)
        answer = max(1, answer)
    }
    
    return answer
}

print(maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]))
//Input: [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
//Output: 4
//Explanation:
//^
//|
//|  o
//|     o        o
//|        o
//|  o        o
//+------------------->
//0  1  2  3  4  5  6

print(maxPoints([[1,1],[2,2],[3,3]]))
//Input: [[1,1],[2,2],[3,3]]
//Output: 3
//Explanation:
//^
//|
//|        o
//|     o
//|  o
//+------------->
//0  1  2  3  4
