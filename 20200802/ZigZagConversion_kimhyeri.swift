//
//  ZigZagConversion.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/31.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 6. ZigZag Conversion

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 {
        return s
    }
    
    struct Position {
        var x: Int
        var y: Int

        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
        
        mutating func moveCross() {
            if x >= 0, y >= 0 {
                self.x = x - 1
                self.y = y + 1
            }
        }
        
        mutating func goAhead() {
            self.x = x + 1
        }
    }
    
    var array = Array(repeating: Array(repeating: "", count: s.count),
                      count: numRows
    )
    var position = Position(x: 0,
                            y: 0
    )
    
    var string = s
    var count = 0
    let crossCount = numRows - 2
    
    while !string.isEmpty {
        count = count + 1

        if count == numRows + 1  {
            position.moveCross()
            for _ in 0..<crossCount {
                if string.isEmpty {
                    break
                }
                array[position.x][position.y] = string.removeFirst().description
                position.moveCross()
            }
            count = 0
        } else {
            if position.x < numRows, position.y < s.count {
                array[position.x][position.y] = string.removeFirst().description
                if count != numRows {
                    position.goAhead()
                }
            }
        }
    }
    return array.flatMap({ $0 }).filter({ $0 != "" }).joined()
}

print(convert("ABCDE", 4))
// "ABCED"

print(convert("AB", 1))
// "AB"

print(convert("PAYPALISHIRING", 3))
// "PAHNAPLSIIGYIR"

print(convert("PAYPALISHIRING", 4))
// "PINALSIGYAHRPI"

// Result
// Runtime: 3416 ms, faster than 5.13% of Swift online submissions for ZigZag Conversion.
// Memory Usage: 62.9 MB, less than 5.13% of Swift online submissions for ZigZag Conversion.
