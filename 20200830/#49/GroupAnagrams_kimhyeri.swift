//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/18.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// #49 Group Anagrams
/// All inputs will be in lowercase
/// The order of your output does not matter

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var answer = [[String]]()
    var dictionary = [String:[String]]()

    for i in 0..<strs.count {
        let word = String(strs[i].sorted())
        
        if let _ = dictionary[word] {
            dictionary[word]!.append(strs[i])
        } else {
            dictionary[word] = [strs[i]]
        }
    }
    
    for value in dictionary.values {
        answer.append(value)
    }
    
    return answer
}

print(groupAnagrams(["",""]))
// [["",""]]
print(groupAnagrams(["","b"]))
// [[""],["b"]]
print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
// [
//   ["ate","eat","tea"],
//   ["nat","tan"],
//   ["bat"]
// ]
print(groupAnagrams(["tea","and","ace","ad","eat","dans"]))
// [["eat","tea"],["and"],["dans"],["ace"],["ad"]]

// Result
// Runtime: 276 ms, faster than 33.49% of Swift online submissions for Group Anagrams.
// Memory Usage: 22.2 MB, less than 99.07% of Swift online submissions for Group Anagrams.
