class Solution {
    func hammingWeight(_ n: Int) -> Int {
        return String(n, radix: 2).filter{ $0 == "1" }.count
    }
}
