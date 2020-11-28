//
//  WordBreak.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/29.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 139. Word Break

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var list = [String: Bool]()

    func findInDict(word: String) -> Bool {

        if wordDict.count == 0 { return false }
        
        if list[word] == true {
            return true
        }

        if wordDict.contains(word) {
            list[word] = true
            return true
        }

        for i in 1 ..< word.count {
            let start = word.index(word.startIndex, offsetBy: i)
            let left = String(word[..<start])
            let right = String(word[start...])

            if wordDict.contains(right), findInDict(word:left) {
                list[word] = true
                return true
            }
        }

        list[word] = false
        return false
    }

    return findInDict(word: s)
}

print(wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]))

print(wordBreak("aaaaaaa", ["aaaa","aa"]))

print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
//Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
//Output: false

print(wordBreak("leetcode", ["leet", "code"]))
//Input: s = "leetcode", wordDict = ["leet", "code"]
//Output: true
//Explanation: Return true because "leetcode" can be segmented as "leet code".
