//
//  CourseScheduleII.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/03/14.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 210. Course Schedule II

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var dictionary = [Int: [Int]]()
    var indegree = [Int](repeating: 0, count: numCourses)
    
    for i in prerequisites {
        if var value = dictionary[i.last!] {
            value.append(i.first!)
            dictionary.updateValue(value, forKey: i.last!)
        } else {
            dictionary.updateValue([i.first!], forKey: i.last!)
        }
        indegree[i[0]] += 1
    }
    
    var array = [Int]()
    for (index, num) in indegree.enumerated() {
        if num == 0 {
            array.append(index)
        }
    }
    
    var res = [Int]()
    while !array.isEmpty {
        let num = array.removeFirst()
        res.append(num)
        if let courses = dictionary[num] {
            for course in courses {
                indegree[course] = indegree[course] - 1
                if indegree[course] == 0 {
                    array.append(course)
                }
            }
        }
    }
    return res.count == numCourses ? res : []
}

print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
print(findOrder(2, [[1,0]]))

//Runtime: 88 ms, faster than 86.67% of Swift online submissions for Course Schedule II.
//Memory Usage: 15.2 MB, less than 42.86% of Swift online submissions for Course Schedule II.
