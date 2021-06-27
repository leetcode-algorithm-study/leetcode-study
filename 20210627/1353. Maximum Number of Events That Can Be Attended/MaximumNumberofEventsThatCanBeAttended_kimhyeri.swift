//
//  main.swift
//  Leet
//
//  Created by 김혜리 on 2021/06/20.
//

import Foundation

class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        var set = Set<Int>()

        let events = events.sorted{
            if $0[1] ==  $1[1] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }

        for event in events {
            for time in event[0]...event[1] {
                if !set.contains(time) {
                    set.insert(time)
                    break
                }
            }
        }
        return set.count
    }
}
