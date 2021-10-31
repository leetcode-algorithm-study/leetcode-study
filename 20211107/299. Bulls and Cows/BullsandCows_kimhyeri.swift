class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var index = 0
        var tempS = secret.map{ String($0) }
        var tempG = guess.map{ String($0) }
        var a = 0
        var b = 0
        var dict = [String: Int]()

        for _ in 0..<secret.count {
            let s = secret.map{ String($0) }[index]
            let g = guess.map{ String($0) }[index]

            if s == g {
                tempS.remove(at: index - a)
                tempG.remove(at: index - a)
                a = a + 1
            } else {
                if tempS.contains(g) {
                    if let a = dict[g] {
                        dict[g] = a + 1
                    } else {
                        dict[g] = 1
                    }
                }
            }
            index = index + 1
        }

        for i in dict {
            b = b + i.value

            if i.value > 0, guess.filter({String($0) == i.key}).count > 1 {
                b = b + 1
            } else {
                b = b + i.value
            }
        }

        return "\(a)A\(b)B"
    }
}
print(getHint("1122", "2211"))
//0A4B

print(getHint("11", "11"))
//2A0B

print(getHint("1123", "0111"))
//1A1B

print(getHint("1807", "7810"))
//1A3B

