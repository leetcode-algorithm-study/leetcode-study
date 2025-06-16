class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var answer = 0
        var temp = "" // 가장긴 substring 찾기

        for i in s {
            let character: Character = i

            if temp.contains(character) {
                if let index = temp.firstIndex(of: character) {
                    let distance = temp.distance(from: temp.startIndex, to: index)
                    print("here temp \(temp) \(distance)")
                    temp.removeFirst(distance + 1)
                    print("here temp \(temp)")
                }
            }
            temp.append(character)
            print(temp)
            answer = max(answer, temp.count)
        }

        return answer
    }
}