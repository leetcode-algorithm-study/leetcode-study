
/**
 * Runtime: 1 ms
 * Memory Usage: 49.6 MB
 */
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int total = 1;
        int zeroCount = 0;
        int length = nums.length;
        int result[] = new int[length];

        for(int num : nums) {
            if(num != 0) total *= num;
            else zeroCount++;
        }
        
        if(zeroCount == 0) {
            for(int i=0; i<length; i++) {
                result[i] = (total/nums[i]);
            }
        } else if(zeroCount == 1) {
            for(int i=0; i<length; i++) {
                if(nums[i] == 0) result[i] = total;
                else result[i] = 0;
            }
        }
        
        return result;
    }
}