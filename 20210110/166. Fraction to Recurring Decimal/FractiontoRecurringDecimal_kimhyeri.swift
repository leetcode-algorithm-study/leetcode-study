//
//  FractiontoRecurringDecimal.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/15.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 166. Fraction to Recurring Decimal

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    var 분자 = numerator
    var 분모 = denominator
    
    if 분자 == 0 { return "0" }
    
    var answer = ""
    if 분자 < 0 && 분모 > 0 || 분자 > 0 && 분모 < 0 { answer.append("-") }
    분자 = abs(분자)
    분모 = abs(분모)
    
    answer.append(String(분자 / 분모))
    var remainder = 분자 % 분모
    // 바로 나누어 떨어짐
    if remainder == 0 {
        return answer
    }
    
    answer.append(".")

    var map = [Int: Int]()
    
    while remainder != 0 {
        remainder *= 10
        answer.append(String(remainder / 분모))
        remainder %= 분모
        if let i = map[remainder] {
            let index = answer.index(answer.startIndex, offsetBy: i)
            answer.insert("(", at: index)
            answer.append(")")
            break
        } else {
            map[remainder] = answer.count
        }
    }
    return answer
}

print(fractionToDecimal(-50, 8))

print(fractionToDecimal(1, 2))
//Input: numerator = 1, denominator = 2
//Output: "0.5"

print(fractionToDecimal(2, 1))
//Input: numerator = 2, denominator = 1
//Output: "2"

print(fractionToDecimal(2, 3))
//Input: numerator = 2, denominator = 3
//Output: "0.(6)"

print(fractionToDecimal(4, 333))
//Input: numerator = 4, denominator = 333
//Output: "0.(012)"

print(fractionToDecimal(1, 5))
//Input: numerator = 1, denominator = 5
//Output: "0.2"
