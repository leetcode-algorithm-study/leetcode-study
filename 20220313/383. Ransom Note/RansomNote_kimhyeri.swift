class Solution {
    // ransomNote가 magazine에 포함되는지 여부 확인
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomNoteDict = [Character: Int]()
        var magazineDict = [Character: Int]()
        
        for i in magazine {
            if let value = magazineDict[i] {
                magazineDict[i] = value + 1
            } else {
                magazineDict[i] = 1
            }
        }
        
        for i in ransomNote {
            if let value = magazineDict[i] {
                if value > 0 {
                    magazineDict[i] = value - 1
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
}
