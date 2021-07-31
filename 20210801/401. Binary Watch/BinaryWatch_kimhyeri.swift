//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
//

import Foundation

class Solution {
    func readBinaryWatch(_ num: Int) -> [String] {
        // 조합 가능한 숫자 배열 생성
        var hour:[[String]] = [["0"],["1","2","4","8"],["3","5","6","9","10"],["7","11"]]
        var minute:[[String]] = [["00"], //1
            ["01", "02", "04", "08", "16", "32"], //6
            ["03", "05", "06", "09", "10", "12", "17", "18", "20", "24", "33", "34", "36", "40", "48"], //15
            ["07", "11", "13", "14", "19", "21", "22", "25", "26", "28", "35", "37", "38", "41", "42", "44", "49", "50", "52", "56"], //20
            ["15", "23", "27", "29", "30", "39", "43", "45", "46", "51", "53", "54", "57", "58"], //14
            ["31", "47", "55", "59"]]
        var answer:[String] = [String]()
        for i in 0..<hour.count {
            for j in 0..<minute.count {
                if i + j == num {
                    for eachH in hour[i] {
                        for eachM in minute[j] {
                            answer.append(eachH+":"+eachM)
                        }
                    }
                }
            }
        }
        return answer
    }
}
