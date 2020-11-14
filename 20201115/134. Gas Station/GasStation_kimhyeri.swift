//
//  GasStation.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/14.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 134. Gas Station

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var answer = -1
    var first = true
    
    func travel (_ currentIndex:Int, _ endIndex:Int, _ tank: Int) {
        var tank = tank
        
        tank = tank + gas[currentIndex]
        
        if currentIndex == endIndex, !first {
            // 성공한 조건
            answer = endIndex
            return
        }
        
        tank = tank - cost[currentIndex]
        
        if tank < 0 {
            return
        } else {
            first = false
            travel((currentIndex + 1) % gas.count, endIndex, tank)
        }
    }
    
    for index in 0..<gas.count {
        first = true
        travel(index,index,0)
    }
    
    return answer
}
