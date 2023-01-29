class Solution {
    func numDecodings(_ s: String) -> Int {
        var store = Array(repeating: 0, count: s.count +  1)

        func decoding(_ s: String) -> Int {
            guard s.first != "0" else { return 0 }
            guard s.count > 1 else { return 1 }

            if store[s.count] != 0 {
                return store[s.count]
            }

            let endIndex = s.index(s.startIndex, offsetBy: 1)
            let firstTwo = Int(s[s.startIndex...endIndex])

            let s1 = String(s.dropFirst())
            let s2 = String(s1.dropFirst())

            var total = 0

            if firstTwo! < 27 {
                total = total + decoding(s2)
            }

            total = total + decoding(s1)
            store[s.count] = total

            return total
        }

        return decoding(s)
    }
}
