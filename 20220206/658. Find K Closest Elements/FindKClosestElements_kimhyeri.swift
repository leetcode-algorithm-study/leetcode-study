//|a - x| < |b - x|, or
//|a - x| == |b - x| and a < b
// x에 가까운 배열을 k개 나열해라

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var answer = [Int]()

        for i in arr {
            if answer.count == k {
                // 제거해주고 넣어야 함
                if let first = answer.first {
                    let a = abs(first - x)
                    let b = abs(i - x)

                    if a > b {
                        answer.removeFirst()
                        answer.append(i)
                    }
                }
            } else {
                // 제거 안해주고 넣음
                answer.append(i)
            }
        }

        return answer
    }
}

print(findClosestElements([1,2,3,4,5], 4, 3))
