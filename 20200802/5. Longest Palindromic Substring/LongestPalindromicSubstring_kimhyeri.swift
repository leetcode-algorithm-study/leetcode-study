//
//  LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/29.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// #5 Longest Palindromic Substring

func getSubSlide(_ array: [Character], _ inputLeft: Int, _ inputRight: Int) -> Int {
    var left = inputLeft
    var right = inputRight
    
    while left > -1, right < array.count, array[left] == array[right] {
        // 영역 확장
        left = left - 1
        right = right + 1
    }
    
    return right - left - 1
}

func longestPalindrome(_ s: String) -> String {
    // 2 미만은 바로 리턴
    if s.count < 2 {
        return s
    }
    
    let array = Array(s)
    var start = 0
    var end = 0
    
    for i in 0..<s.count {
        
        let middle1 = getSubSlide(array, i, i)
        let middle2 = getSubSlide(array, i, i+1)
        let choose = max(middle1, middle2)
        
        if choose > end - start + 1 {
            start = i - (choose - 1) / 2
            end = i + choose / 2
        }
    }

    let startIndex = s.index(s.startIndex, offsetBy: start)
    let endIndex = s.index(s.startIndex, offsetBy: end)
    let range = startIndex...endIndex
    return String(s[range])
}

// Result
// Runtime: 148 ms, faster than 91.76% of Swift online submissions for Longest Palindromic Substring.
// Memory Usage: 21.1 MB, less than 78.95% of Swift online submissions for Longest Palindromic Substring.

//func longestPalindrome(_ s: String) -> String {
//    var answer = ""
//    var str = s
//
//    // 1 이하는 바로 리턴
//    if str.count <= 1 {
//        return str
//    }
//
//    // 2 이상 부터 시작할 수 있음
//    while !str.isEmpty, s.count / 2 < str.count  {
//        for i in 1...str.count {
//            let new = str.prefix(i)
//            let last = new.suffix(i)
//            if new == last {
//                if new == String(last.reversed()), answer.count < new.count {
//                    answer = new.description
//
//                }
//            } else {
//                break
//            }
//        }
//
//        str.removeFirst()
//    }
//
//    return answer
//}
print(longestPalindrome("bananas"))
// "anana"

print(longestPalindrome("aaa"))
// "a"

print(longestPalindrome("caba"))
// "aba"

print(longestPalindrome("aba"))
// aba

print(longestPalindrome("ccc"))
// ccc

print(longestPalindrome("babad"))
// "bab"

print(longestPalindrome("cbbd"))
// "bb"
//
////print(longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"))
//// "ranynar" 시간초과
