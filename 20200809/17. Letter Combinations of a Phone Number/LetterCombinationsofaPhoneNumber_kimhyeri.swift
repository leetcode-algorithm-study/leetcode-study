//
//  LetterCombinationsofaPhoneNumber.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/07.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 17. Letter Combinations of a Phone Number

func letterCombinations(_ digits: String) -> [String] {
    var answer = [String]()
    
    if digits.count == 0 {
        return answer
    }
        
    let dictionary: [Int: [String]] = [2: ["a","b","c"],
                                       3: ["d","e","f"],
                                       4: ["g","h","i"],
                                       5: ["j","k","l"],
                                       6: ["m","n","o"],
                                       7: ["p","q","r","s"],
                                       8: ["t","u","v"],
                                       9: ["w","x","y","z"]
    ]
    
    func repeating(string: String, numbers: String) {
        var numbers = numbers
        
        if numbers.isEmpty, string.count == digits.count  {
            answer.append(string)
        } else {
            while !numbers.isEmpty {
                let digit = numbers.removeFirst()
                let value = dictionary[Int(String(digit))!]!
                
                for i in value {
                    repeating(string: string + i,
                              numbers: String(numbers)
                    )
                }
            }
        }
    }
    repeating(string: "", numbers: digits)

    return answer
}

print(letterCombinations("23"))

// Result
// Runtime: 4 ms, faster than 95.66% of Swift online submissions for Letter Combinations of a Phone Number.
// Memory Usage: 21.5 MB, less than 12.72% of Swift online submissions for Letter Combinations of a Phone Number.
