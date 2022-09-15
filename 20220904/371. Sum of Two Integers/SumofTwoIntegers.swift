class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let carry = (a & b) << 1
            a = a ^ b
            b = carry
        }
        
        return a
    }
}

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return a.advanced(by: b)
    }
}
