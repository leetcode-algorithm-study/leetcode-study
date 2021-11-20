class MagicDictionary {
    var dict: [String: String]
    
    init() {
        dict = [String: String]()
    }
    
    func buildDict(_ dictionary: [String]) {
        for i in dictionary {
            dict[i] = i
        }
    }
        
    func search(_ searchWord: String) -> Bool {
        for (key, _) in dict {
            if key.count == searchWord.count {
                var matching = false

                for i in 0..<searchWord.count {
                    if Array(key)[i] != Array(searchWord)[i] {
                        if matching {
                            matching = false
                            break
                        }
                        matching = true
                    }
                }

                if matching {
                    return true
                }
            }
        }
        return false
    }
}

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * let obj = MagicDictionary()
 * obj.buildDict(dictionary)
 * let ret_2: Bool = obj.search(searchWord)
 */
