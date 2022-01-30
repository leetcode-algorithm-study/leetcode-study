class Solution {
    
    Map<Integer, LinkedList<Integer>> map = new HashMap<>();
    Random random = new Random();

    public Solution(int[] nums) {
        for(int i=0; i<nums.length; i++) {
            LinkedList<Integer> list = map.getOrDefault(nums[i], new LinkedList<>());
            list.push(i);
            map.put(nums[i], list);
        }
    }

    public int pick(int target) {
        LinkedList<Integer> list = map.get(target);
        return list.get(random.nextInt(list.size()));
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(nums);
 * int param_1 = obj.pick(target);
 */