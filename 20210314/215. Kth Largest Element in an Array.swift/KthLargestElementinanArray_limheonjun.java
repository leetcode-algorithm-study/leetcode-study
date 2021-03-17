import java.util.PriorityQueue;
import java.util.Queue;

/**
 * Runtime: 6 ms
 * Memory Usage: 39.5 MB
 */
class Solution {

    public static int findKthLargest(int[] nums, int k) {
        int len = nums.length;

        Queue<int[]> pq = new PriorityQueue<>((o1, o2) -> {
            if(o1[0] - o2[0] > 0) return -1;
            else return 1;
        });

        for(int i=0; i<len; i++) {
            pq.add(new int[]{nums[i], i});
        }

        for(int i=0; i<k; i++) {
            pq.poll();
        }

        return pq.poll()[0];
    }
}
