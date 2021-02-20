import Foundation

/// 179. Largest Number

func largestNumber(_ nums: [Int]) -> String {
    let result = nums.map { String($0) }
    let results = result.sorted(by: { $0 + $1 > $1 + $0 })
    let answer = results.joined()
    print(answer)
    
    return answer.starts(with: "0") ? "0" : answer
}

//func largestNumber(_ nums: [Int]) -> String {
//    if nums.count == 1 { return String(nums.first!) }
//
//    var array = nums.map { String($0).compactMap{Int(String($0))} }
//
//    var answer = ""
//    var l = 0
//    var max = 0
//    var same = [[Int]]()
//    var index = [Int]()
//    // 첫 자리가 가장 큰 것 찾아내기
//
//    func highestFirst(arr: [[Int]]) {
//        max = 0
//        index.removeAll()
//
//        for i in 0..<array.count {
//            if array[i].first! > max {
//                max = array[i].first!
//                same.removeAll()
//                same.append(array[i])
//                index.removeAll()
//                index.append(i)
//            } else if array[i].first! == max {
//                same.append(array[i])
//            }
//        }
//    }
//
//    highestFirst(arr: array)
//
//    while true {
//        if l == nums.count - 1 { break }
//
//        // 맨앞에서 제일 큰거 찾아내기
//        highestFirst(arr: array)
//        // same에는 맨앞에서 제일 큰거와 동일한 앞자리만 가짐
//        if same.count < 2 {
////            answer.append(String(array.first))
//            array.remove(at: index.first!)
//            index.removeAll()
//        } else {
//
//            highestFirst(arr: same)
//
//
//        }
//
//        l = l + 1
//    }
//
//    print(array)
//    return answer
//}

print(largestNumber([10,2]))
//Input: nums = [10,2]
//Output: "210"

print(largestNumber([3,30,34,5,9]))
//Input: nums = [3,30,34,5,9]
//Output: "9534330"

print(largestNumber([1]))
//Input: nums = [1]
//Output: "1"

print(largestNumber([10]))
//Input: nums = [10]
//Output: "10"
