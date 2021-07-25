class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        int j = 0;
        int length = nums.length;
        Map<Integer, Integer> map = new HashMap<>();
        boolean result = false;
        
        while(j < length){
            if(!map.containsKey(nums[j]) ) map.put(nums[j], j);
            else {
                Integer index = map.get(nums[j]);
                if(isLessThanK(index, j, k, nums)){
                    result = true;
                } else {
                    map.put(nums[j], j);
                }

            }
            j++;
        }
        return result;
    }

    private boolean isLessThanK(int i, int j, int k, int nums[]){
        return Math.abs(i - j) <= k;
    }
}