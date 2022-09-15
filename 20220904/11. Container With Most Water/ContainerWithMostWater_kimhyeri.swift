class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var answer = 0
        
        while left < right {
            answer = max(answer, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left = left + 1
            } else if height[left] > height[right] {
                right = right - 1
            } else {
                left = left + 1
                right = right - 1
            }
        }
        
        return answer
    }
}
