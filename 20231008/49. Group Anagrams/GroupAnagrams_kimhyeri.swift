class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for str in strs {
            let key = String(str.sorted())
            dict[key, default: []].append(str)
        }

        return Array(dict.values)
    }
}