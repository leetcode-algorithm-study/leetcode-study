//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/24.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// #3 Longest Substring without repeating characters

func lengthOfLongestSubstring(_ s: String) -> Int {
    var answer = 0
    var temp = "" // 가장 긴 substring 찾기

    for i in s {
        let character: Character = i

        if temp.contains(character) {
            if let index = temp.firstIndex(of: character) {
                let distance = temp.distance(from: temp.startIndex, to: index)
                // 해당 사항인 character 1개 지운다는 말
                temp.removeFirst(distance+1)
            }
        }
        temp.append(character)
        answer = max(answer, temp.count)
    }

    return answer
}

print(lengthOfLongestSubstring("ckilbkd"))
// 5

print(lengthOfLongestSubstring("aab"))
// 2

print(lengthOfLongestSubstring("dvdf"))
// 3

print(lengthOfLongestSubstring("abcabcbb"))
// 3

print(lengthOfLongestSubstring("bbbbb"))
// 1

print(lengthOfLongestSubstring("pwwkew"))
// 3

print(lengthOfLongestSubstring(""))
// 0

// Result
// Runtime: 152 ms, faster than 22.86% of Swift online submissions for Longest Substring Without Repeating Characters.
// Memory Usage: 21 MB, less than 87.21% of Swift online submissions for Longest Substring Without Repeating Characters.
