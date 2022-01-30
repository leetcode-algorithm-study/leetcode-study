class Solution {
    func lastRemaining(_ n: Int) -> Int {
        var head = 1
        var remain = n
        var left = true
        var step = 1
        
        while remain > 1 {
            if left || remain % 2 == 1 {
                head = head + step
            }
            
            remain = remain / 2
            step = step * 2
            left.toggle()
        }
        return head
    }
}
