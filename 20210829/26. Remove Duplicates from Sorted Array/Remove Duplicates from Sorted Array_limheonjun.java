class Solution {
    public int removeDuplicates(int[] nums) {
       if(nums.length == 0) return 0;
        int start = 0;
        int end = 1;
        int exNumber = nums[start++];
        int length = nums.length;

        while(end < length){
            //다른경우
            if(exNumber != nums[end]){
                nums[start] = nums[end];
                exNumber = nums[start];
                start++;
            }
            //같은 경우
            end++;
        }
        
        return start; 
    }
}

