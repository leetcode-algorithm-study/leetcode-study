/*
Runtime: 0 ms, faster than 100.00% of Java online submissions for Find the Duplicate Number.
Memory Usage: 38.7 MB, less than 77.11% of Java online submissions for Find the Duplicate Number.
*/
class Solution {
    public int findDuplicate(int[] nums) {
        int length = nums.length;
        int overlapCheck[] = new int[length];
        int overlapCount = 0;
        
        for(int i=0; i<length; i++) {
            if(overlapCheck[nums[i]] != 0) return nums[i];
            else overlapCheck[nums[i]]++;
        }
        
        return overlapCount;
    }
}