/**
 * Runtime: 4 ms, faster than 21.98% of Java online submissions for Max Consecutive Ones III.
 * Memory Usage: 40.1 MB, less than 72.81% of Java online submissions for Max Consecutive Ones III.
 */
class Solution {
    public int longestOnes(int[] nums, int k) {
        if(nums.length < k) return nums.length;
        int length = nums.length;
        int zeroCount = 0;
        int nonZeroCount = 0;
        int start = 0;
        int end = 0;
        int max = 0;

        while(end < length) {
            
            if(!isZero(nums[end])) nonZeroCount++;
            if(isZero(nums[end])) zeroCount++;

            /**
             * zeroCount가 k를 초과한 경우
             * start는 zeroCount가 k랑 같아질때까지 전진
             */
            if(zeroCount > k) {
                while(zeroCount != k) {
                    if(!isZero(nums[start])) nonZeroCount--;
                    if(isZero(nums[start])) zeroCount--;
                    start++;
                }
            }

            /**
             * end는 zeroCount가 k랑 같은 경우에도 다음 0이 나올때까지 전진
             */
            if(zeroCount == k) {
                while(end+1 < length && !isZero(nums[++end])) {
                    nonZeroCount++;
                }
                
                max = Math.max(max, zeroCount + nonZeroCount);
                if(end+1 < length) end--;
            }

            end++;
        }
        
        max = Math.max(max, zeroCount + nonZeroCount);
        return max;
    }

    private boolean isZero(int i){
        return i == 0;
    }
}