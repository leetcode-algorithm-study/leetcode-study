class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else { return "0" }

        func getInteger(_ s: String) -> Int? {
            return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].firstIndex(of: s)
        }

        // integer 배열로 만들기
        let arr1 = num1.compactMap{ getInteger(String($0)) }
        let arr2 = num2.compactMap{ getInteger(String($0)) }

        var result: [Int] = []

        for val2 in arr2.reversed().enumerated() {
            for val1 in arr1.reversed().enumerated() {
                let index = val2.offset + val1.offset
                if !result.indices.contains(index) {
                    result.append(0)
                }

                let cur = result[index]
                let v1 = (val1.element * val2.element + cur) % 10
                let v2 = (val1.element * val2.element + cur) / 10
                result[index] = v1

                // 캐리가 발생하는 경우
                if v2 > 0 {
                    if !result.indices.contains(index + 1) {
                        result.append(0)
                    }
                    result[index + 1] = result[index + 1] + v2
                }
            }
        }

        return result.reversed().map{ String($0) }.joined()
    }
}
