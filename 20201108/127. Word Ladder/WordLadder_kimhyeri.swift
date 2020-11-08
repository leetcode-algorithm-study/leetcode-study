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
    
    let alphab = "abcdefghijklmnopqrstuvwxyz"
    var queue = [(beginWord, 1)]
    var setList = Set<String>(wordList)
    
    while !queue.isEmpty {
        let value = queue.removeFirst()
        
        if value.0 == endWord {
            return value.1
        }
        
        // transform word
        for i in 0..<value.0.count {
            var wordArray = Array(value.0)
            
            for char in alphab {
                guard char != wordArray[i] else {
                    continue
                }
                
                wordArray[i] = char
                let transformedWord = String(wordArray)
                
                // 하나 바꾸고 wordSet에 있는지 확인
                // (hit이면 , ait, bit, cit) (hit이면 hat, hbt,..)
                
                guard setList.contains(transformedWord) else {
                    continue
                }
                
                setList.remove(transformedWord) // transformword는 리스트에서 제거
                queue.append((transformedWord, value.1 + 1)) // value.1은 1추가하고 transformword는 queue에 추가한다
            }
        }
    }
    return 0
}

print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))

