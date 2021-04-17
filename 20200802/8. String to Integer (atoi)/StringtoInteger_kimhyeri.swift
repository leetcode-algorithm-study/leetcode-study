//
//  StringtoInteger.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/01.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 8. String to Integer
/// Only the space character ' ' is considered as whitespace character.
/// Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.

func myAtoi(_ str: String) -> Int {
    // 빈칸 다 삭제
    let string = str.trimmingCharacters(in: .whitespaces)
    var realStr = ""

    // 문자가 먼저 나오는 경우 처리
    for i in string {
        if let _ = Int(String(i)) {
            // 숫자가 먼저 나옴(숫자 발견)
            realStr.append(i)
        } else if realStr.count == 0, i == "-" || i == "+" {
            realStr.append(i)
        } else {
            // 문자열이 먼저 나옴 return 0
            if realStr.count == 0 {
                return 0
            }
            // 문자열 뒤는 필요한 없다고 판단하고 break
            break
        }
    }
    
    // 현재 가진 문자열로 추출 가능하다면
    if let value = Int32(realStr) {
        return Int(value)
    } else {
        // 숫자만 일단 다 뽑아보자
        let result = realStr.filter("0123456789".contains)
        
        // 문자열에 숫자가 포함되지 않았을 때
        if result.count == 0 {
            return 0
        }
        
        // Int32 범위 벗어나는 건 일로오겠구만
        if realStr.hasPrefix("-") {
            return Int(Int32.min)
        } else {
            return Int(Int32.max)
        }
    }
}

print(myAtoi("  -0012a42"))
// -12

print(myAtoi("+-2"))
// 0

print(myAtoi("3.14159"))
// 3

print(myAtoi("42"))
// 42

print(myAtoi("   -42"))
// -42

print(myAtoi("4193 with words"))
// 4193

print(myAtoi("words and 987"))
// 0

print(myAtoi("-91283472332"))
// -2147483648
//The number "-91283472332" is out of the range of a 32-bit signed integer.

print(myAtoi("2147483648"))
// 2147483647

print(myAtoi("0-1"))
// 0

// Runtime: 28 ms, faster than 33.63% of Swift online submissions for String to Integer (atoi).
// Memory Usage: 21.6 MB, less than 23.81% of Swift online submissions for String to Integer (atoi).
