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
    

    
    return answer
}

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
