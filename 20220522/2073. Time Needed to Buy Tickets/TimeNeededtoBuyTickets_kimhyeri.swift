class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var tickets = tickets
        var time = 0
        
        while tickets[k] > 0 {
            for i in 0..<tickets.count {
                if tickets[i] > 0, tickets[k] != 0 {
                    tickets[i] = tickets[i] - 1
                    time = time + 1
                }
            }
        }
        
        return time
    }
}
