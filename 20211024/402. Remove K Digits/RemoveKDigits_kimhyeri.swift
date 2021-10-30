class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var temp = [String]()
        var array = [Int]()

        if num.count == k { return "0" }
        
        for i in 0..<num.count - k {
            temp = num.map { String($0) }
            let range = i..<i+k
            temp.removeSubrange(range)
            array.append(Int(temp.joined())!)
        }

        print(array)
        return String(array.sorted().first!)
    }
}
