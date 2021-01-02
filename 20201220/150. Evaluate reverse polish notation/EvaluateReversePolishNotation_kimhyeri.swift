//
//  EvaluateReversePolishNotation.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/01/03.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 150. Evaluate Reverse Polish Notation

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    
    for token in tokens {
        if let num = Int(token) {
            stack.append(num)
        } else {
            // 연산자 만나면 진행
            if let post = stack.popLast(), let prev = stack.popLast() {
                var result = 0
                switch token {
                case "+":
                    result = prev + post
                case "-":
                    result = prev - post
                case "*":
                    result = prev * post
                case "/":
                    result = prev / post
                default:
                    print("nothing")
                }
                stack.append(result)
                result = 0
            }
        }
    }
    
    return stack.last ?? 0
}

print(evalRPN(["4","13","5","/","+"]))
//Output: 6


print(evalRPN(["2", "1", "+", "3", "*"]))
//Input: ["2", "1", "+", "3", "*"]
//Output: 9
//Explanation: ((2 + 1) * 3) = 9

print(evalRPN(["4", "13", "5", "/", "+"]))
//Input: ["4", "13", "5", "/", "+"]
//Output: 6
//Explanation: (4 + (13 / 5)) = 6

print(evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]))
//Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
//Output: 22
//Explanation:
//  ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
//= ((10 * (6 / (12 * -11))) + 17) + 5
//= ((10 * (6 / -132)) + 17) + 5
//= ((10 * 0) + 17) + 5
//= (0 + 17) + 5
//= 17 + 5
//= 22
