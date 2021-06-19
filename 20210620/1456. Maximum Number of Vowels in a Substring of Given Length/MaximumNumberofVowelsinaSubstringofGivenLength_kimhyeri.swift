//
//  main.swift
//  Leet
//
//  Created by 김혜리 on 2021/06/20.
//

import Foundation

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowels: Set<Character> = ["a", "o", "e", "i", "u"]
        let array: Array<Character> = Array(s)
        var answer: Int = 0
        var temp: Int = 0

        for index in 0..<array.count {
            let character = array[index]
            if vowels.contains(character) {
                temp = temp + 1
            }

            if index >= k {
                let remove = array[index-k]
                if vowels.contains(remove) {
                    temp = temp - 1
                }
            }

            answer = max(temp, answer)
        }

        return answer
    }
}
