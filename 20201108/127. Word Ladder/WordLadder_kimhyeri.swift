//
//  WordLadder.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/07.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 127. Word Ladder

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    if !wordList.contains(endWord) {
        return 0
    }
    
    var queue = [(beginWord, 1)]
    var wordSet = Set<String>(wordList)
    
    while !queue.isEmpty {
        let (word, step) = queue.removeFirst()
        
        if word == endWord {
            return step
        }
        
        // transform word
        for i in 0..<word.count {
            var wordArray = Array(word)
            
            for char in "abcdefghijklmnopqrstuvwxyz" {
                guard char != wordArray[i] else {
                    continue
                }
                
                wordArray[i] = char
                let transformedWord = String(wordArray)
                
                guard wordSet.contains(transformedWord) else {
                    continue
                    // 하나 바꾸고 wordSet에 있는지 확인
                    // (hit이면 , ait, bit, cit) (hit이면 hat, hbt,..)
                }
                
                wordSet.remove(transformedWord) // transformword는 리스트에서 제거
                queue.append((transformedWord, step + 1)) // step은 추가하고 transformword는 queue에 추가한다
            }
        }
    }
    return 0
}

print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))

