//TLE O(n^2)
//class Solution {
//    func maxSubArray(_ nums: [Int]) -> Int {
//        var answer = nums.max() ?? 0
//
//        for i in 0..<nums.count {
//            for j in stride(from: nums.count - 1, to: i, by: -1) {
//                let sub = nums[i...j]
//                let sum = sub.reduce(0, +)
//                answer = max(answer, sum)
//            }
//        }
//
//        return answer
//    }
//}


// 카데인 알고리즘 적용해야 통과되네...
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var array = Array(nums)
        var answer = nums[0]
        
        // 첫번째 값은 nums[0]으로 설정
        // sub array 시작
        array[0] = nums[0]
        
        // index 1 부터 시작하면서 array[i]를 채워나간다.
        // array[i] 앞에 저장해놓은 이전 값[i-1]과 현재 인덱스[i]를 더해주고 nums[i]와 비교해서 큰 값을 넣어준다.
        // answer 최대값 적용
        for i in 1 ..< nums.count {
            array[i] = max(nums[i] + array[i-1], nums[i])
            answer = max(answer, array[i])
        }
        
        return answer
    }
}
