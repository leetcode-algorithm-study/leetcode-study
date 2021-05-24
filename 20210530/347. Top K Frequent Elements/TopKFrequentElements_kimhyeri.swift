class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        
        // 횟수 증가
        for i in nums {
            if let value = dict[i] {
                dict.updateValue(value + 1, forKey: i)
            } else {
                dict[i] = 1
            }
        }
        
        // 값으로 정렬
        // 튜플 저장
        var tuple: Array<(key: Int, value: Int)> = []
        
        for (key, value) in dict {
            tuple.append((key,value))
        }
        
        var sorting = tuple.sorted { $0.1 > $1.1 }
        print(sorting)
        
        // 키 담을 배열
        var answer = [Int]()
        
        for i in 0..<k {
            if !sorting.isEmpty {
                answer.append(sorting.removeFirst().key)
            }
        }
        
        return answer
    }
}
