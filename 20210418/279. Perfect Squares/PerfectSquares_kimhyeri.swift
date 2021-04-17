class Solution {
    func numSquares(_ n: Int) -> Int {
        var answer = 0
        var square = [Int]()
        
        for i in 1...n {
            if i * i > n {
                break
            }
            square.append(i*i)
        }

        print(square)
        var array = [n]
        var temp = [Int]()
        
        while !array.isEmpty {
            answer = answer + 1
            for remainder in array {
                for squareVal in square {
                    if squareVal == remainder {
                        return answer
                    } else if squareVal > remainder {
                        break
                    } else if squareVal < remainder {
                        let val = remainder - squareVal
                        temp.append(val)
                    }
                }
            }
            array = temp
        }

        return answer
    }
}
