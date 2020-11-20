//
//  MinimumWindowSubstring.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/15.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 76. Minimum Window Substring

extension String {
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func minWindow(_ s: String, _ t: String) -> String {
    var answer = ""
    var dictionary = [String: [Int]](), tDictionary = [String: [Int]]()
    
    if t.count > s.count { return "" }
    
    func updateDict(tOrs: Bool, s: String) {
        for i in 0..<s.count {
            if tOrs {
                if var array = dictionary[s[i]] {
                    array.append(i)
                    dictionary.updateValue(array, forKey: s[i])
                } else {
                    dictionary.updateValue([i], forKey: s[i])
                }
            } else {
                if var array = tDictionary[s[i]] {
                    array.append(i)
                    tDictionary.updateValue(array, forKey: s[i])
                } else {
                    tDictionary.updateValue([i], forKey: s[i])
                }
            }
        }
    }
    
    updateDict(tOrs: false, s: t)
    
    func isValid(string: String) -> Bool {
        dictionary.removeAll()
        updateDict(tOrs: true, s: string)
        
        for i in t {
            if !string.contains(i) {
                return false
            }
        }
        
        // 주어진 s단어에 대한 딕
        for (key, value) in dictionary {
            if let tCount = tDictionary[key]?.count {
                if tCount > value.count {
                    return false
                }
            }
        }
        return true
    }
    
    var start = 0
    var end = t.count
    
    firstLoop: while start < s.count  {
        secondLoop: while true {
            if end > s.count {
                break secondLoop
            }
            
            let range = start..<end
            
            if isValid(string: s[range]) {
                // 처음 답 넣을 때
                if answer == "" {
                    answer = s[range]
                }
                
                // 두 번째 답 넣을 때
                else if answer.count > s[range].count {
                    answer = s[range]
                }
            }
            end = end + 1
        }
        start = start + 1
        end = start + t.count
    }
    
    return answer
}


// Time Limit Exceeded limit
// "wegdtzwabazduwwdysdetrrctotpcepalxdewzezbfewbabbseinxbqqplitpxtcwwhuyntbtzxwzyaufihclztckdwccpeyonumbpnuonsnnsjscrvpsqsftohvfnvtbphcgxyumqjzltspmphefzjypsvugqqjhzlnylhkdqmolggxvneaopadivzqnpzurmhpxqcaiqruwztroxtcnvhxqgndyozpcigzykbiaucyvwrjvknifufxducbkbsmlanllpunlyohwfsssiazeixhebipfcdqdrcqiwftutcrbxjthlulvttcvdtaiwqlnsdvqkrngvghupcbcwnaqiclnvnvtfihylcqwvderjllannflchdklqxidvbjdijrnbpkftbqgpttcagghkqucpcgmfrqqajdbynitrbzgwukyaqhmibpzfxmkoeaqnftnvegohfudbgbbyiqglhhqevcszdkokdbhjjvqqrvrxyvvgldtuljygmsircydhalrlgjeyfvxdstmfyhzjrxsfpcytabdcmwqvhuvmpssingpmnpvgmpletjzunewbamwiirwymqizwxlmojsbaehupiocnmenbcxjwujimthjtvvhenkettylcoppdveeycpuybekulvpgqzmgjrbdrmficwlxarxegrejvrejmvrfuenexojqdqyfmjeoacvjvzsrqycfuvmozzuypfpsvnzjxeazgvibubunzyuvugmvhguyojrlysvxwxxesfioiebidxdzfpumyon"
// "ozgzyywxvtublcl"
