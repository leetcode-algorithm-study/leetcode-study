class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var group = [String: [String]]()

        for i in strs {
            let sortedString = i.sorted()
            if var groupList = group[String(sortedString)] {
                groupList.append(i)
                group[String(sortedString)] = groupList
            } else {
                group[String(sortedString)] = [i]
            }
        }

        return group.values.map { $0 }
    }
}
