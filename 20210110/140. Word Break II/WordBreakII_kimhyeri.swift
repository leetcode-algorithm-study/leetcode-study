//
//  WordBreakII.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/17.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 140. Word Break II

func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var dict = [String: [String]]()
    let words = Set(wordDict)

    return getSentences(s, words, &dict)
}

func getSentences(_ s: String, _ words: Set<String>, _ dict: inout [String: [String]]) -> [String] {
    if let found = dict[s] { return found }
    let sCount = s.count
    var result = [String]()

    for i in 0..<sCount {
        let mid = s.index(s.startIndex, offsetBy: i)
        let end = s.index(s.startIndex, offsetBy: sCount)
        let suffix = String(s[mid..<end])

        if words.contains(suffix) {
            if i == 0 {
                result.append(suffix)
            } else {
                let prefix = String(s[s.startIndex..<mid])
                let sentences = getSentences(prefix, words, &dict)
                for sentence in sentences {
                    result.append(sentence + " " + suffix)
                }
            }
        }
    }
    dict[s] = result
    return result
}

print(wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"]))

//Output:
//[
//  "cats and dog",
//  "cat sand dog"
//]
