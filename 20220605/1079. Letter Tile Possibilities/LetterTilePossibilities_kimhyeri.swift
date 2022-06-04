class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var map = [Character: Int]()
        
        for i in tiles {
            if let count = map[i] {
                map[i] = count + 1
            } else {
                map[i] = 1
            }
        }
        var result = 0
        
        func generate(length:Int, new:[Character: Int]) {
            if length > 0 {
                result+=1
            }
            for (char,count) in new {
                if count > 0 {
                    var newChoices = new
                    newChoices[char] = count - 1
                    generate(length: length + 1, new: newChoices)
                }
            }
        }
        generate(length: 0, new: map)
        
        return result
    }
}
