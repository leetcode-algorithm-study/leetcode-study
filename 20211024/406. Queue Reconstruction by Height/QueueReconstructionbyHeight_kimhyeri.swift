class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let people = people.sorted(by: { person1, person2 in
            if person1.first! == person2.first! {
                return person1.last! < person2.last!
            } else {
                return person1.first! > person2.first!
            }
        })
        
        var ansewr = [[Int]]()
        
        print(people)
        
        for person in people { ansewr.insert(person, at: person[1]) }
        
        return ansewr
    }
}
