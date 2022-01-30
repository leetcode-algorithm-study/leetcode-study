class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        var sumList = [Int]()
        
        var sum = 0
        var k = 0
        var nums = nums
        var count = nums.count
        
        while count > 0 {
            sum = 0
            k = 0

            for i in nums {
                sum = sum + (i * k)
                print(sum)
                k = k + 1
            }
            
            sumList.append(sum)
            count = count - 1
            
            let val = nums.removeFirst()
            nums.append(val)
        }
        
        sumList.sort()
        return sumList.removeLast()
    }
}
