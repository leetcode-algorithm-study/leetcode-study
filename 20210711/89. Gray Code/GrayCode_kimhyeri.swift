//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

func grayCode(_ n: Int) -> [Int] {
    var list = [0]

    if n==0 {
        return list
    } else {
        list.append(1)
        var current = 1

        if n > 1 {
            for _ in 2...n {
                current = current * 2
                let count = list.count - 1
                for j in stride(from: count, through: 0, by: -1) {
                    list.append(current + list[j])
                }
            }
        }
        return list
    }
}

print(grayCode(2))
