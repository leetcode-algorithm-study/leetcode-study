//
//  DivideTwoIntegers .swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/15.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 29. Divide Two Integers

/// Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
/// Return the quotient after dividing dividend by divisor.
/// The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var dividend = dividend, divisor = divisor
    var acheck = false, bcheck = false
    var count = 0
    
    // a 양수화, b 양수화
    if dividend < 0 {
        acheck = true
        dividend = abs(dividend)
    }
    if divisor < 0 {
        bcheck = true
        divisor = abs(divisor)
    }

     while dividend >= divisor {
         var shift = 0
         
         while dividend >= (divisor << shift) {
             shift += 1
         }
         dividend = dividend - (divisor << (shift - 1))
         count = count + (1 << (shift - 1))
     }
     
    if acheck == bcheck {
        if count > Int32.max {
            count = Int(Int32.max)
        }
    } else {
        count = -1 * count
    }
    return count
 }

print(divide(-2147483648, 2))

print(divide(-2147483648, -1))
// 2147483647

print(divide(10, 3))
// Input: dividend = 10, divisor = 3
// Output: 3
// Explanation: 10/3 = truncate(3.33333..) = 3.

print(divide(7, -3))
// Input: dividend = 7, divisor = -3
// Output: -2
// Explanation: 7/-3 = truncate(-2.33333..) = -2.

// Result
// Runtime: 8 ms, faster than 87.23% of Swift online submissions for Divide Two Integers.
// Memory Usage: 20.6 MB, less than 63.83% of Swift online submissions for Divide Two Integers.

//func divide(_ dividend: Int, _ divisor: Int) -> Int {
//    var answer = 0
//    var a = dividend, b = divisor
//    var acheck = false, bcheck = false
//
//    // a 양수화, b 양수화
//    if a < 0 {
//        acheck = true
//        a = abs(a)
//    }
//    if b < 0 {
//        bcheck = true
//        b = abs(b)
//    }
//
//    // 범위 초과했을 경우
//    if (dividend >= Int32.max || dividend <= Int32.min)
//        && (divisor == 1 || divisor == -1) {
//        return acheck == bcheck ? Int(Int32.max) : Int(Int32.min)
//    }
//
//    // a,b같으면 1으로 리턴
//    if a == b {
//        return acheck == bcheck ? 1 : -1
//    }
//
//    // 나눌려고 하는 수가 1이면 a리턴
//    if divisor == 1 || divisor == -1 {
//        return acheck == bcheck ? a : -a
//    }
//
//    while true {
//        if a > b {
//            answer = answer + 1
//            a = a - b
//        } else {
//            if acheck != bcheck {
//                return Int("-\(answer)")!
//            }
//            return answer
//        }
//    }
//}
// 시간초과
