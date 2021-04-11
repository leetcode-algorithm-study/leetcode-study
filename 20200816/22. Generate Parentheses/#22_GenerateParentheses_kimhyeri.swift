//
//  GenerateParentheses.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/15.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 22. Generate Parentheses

func generateParenthesis(_ n: Int) -> [String] {
    guard n > 0 else {
        return [String]()
    }
    
    var answer = [String]()
    
    func dfs(string: String, left: Int, right: Int) {
        print("left: \(left), right: \(right)")
        if right == 0 {
            answer.append(string)
            return
        }
        if left > 0 {
            dfs(string: "\(string)(",
                left: left - 1,
                right: right
            )
        }
        if right > left {
            dfs(string: "\(string))",
                left: left,
                right: right - 1
            )
        }
    }
    
    dfs(string: "", left: n, right: n)
    return answer
}

print(generateParenthesis(2))

// [
//  "((()))",
//  "(()())",
//  "(())()",
//  "()(())",
//  "()()()"
// ]

// Result
// Runtime: 20 ms, faster than 53.98% of Swift online submissions for Generate Parentheses.
// Memory Usage: 21.4 MB, less than 14.60% of Swift online submissions for Generate Parentheses.

/*
 struct Stack {
     var stack = [String]()
     
     mutating func pop() {
         stack.removeLast()
     }
     
     mutating func push(element: String) {
         stack.append(element)
     }
     
     func isEmpty() -> Bool {
         return stack.isEmpty
     }
 }

 
 func generateParenthesis(_ n: Int) -> [String] {
     guard n > 0 else {
         return [String]()
     }
     
     // required left, right count
     var left: String = String(repeatElement("(", count: n))
     var right: String = String(repeatElement(")", count: n))
         
     var set: Set<String> = Set<String>()
     var stack = Stack()
     var answerString = left
     var answerArr = [String]()
     var leftCount = 0, rightCount = 0
     
     func appendParenthesis(string: String) {
         if string.count == n * 2 {
             answerArr.append(string)
             return
         } else {
             
         }
     }
     
     while true {
         appendParenthesis(string: answerString)
     }

     var realCount = 0
     
     // stack valid check
     for i in answerString {
         if String(i) == right, !stack.isEmpty() {
             stack.pop()
             realCount = realCount + 1
         } else {
             stack.push(element: left)
         }
     }
     
     // check stack is Empty & real count is equal n
     if stack.isEmpty(), realCount == n {
         set.insert(answerString)
     }
     
     return set.map{ $0 }
 }
 */
