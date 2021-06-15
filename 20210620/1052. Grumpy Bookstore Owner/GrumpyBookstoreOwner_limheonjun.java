/**
Runtime: 4 ms, faster than 31.95% of Java online submissions for Grumpy Bookstore Owner.
Memory Usage: 41.8 MB, less than 20.22% of Java online submissions for Grumpy Bookstore Owner.
*/

class Solution {
    
    private static final int GRUMPY = 1;
    
    public int maxSatisfied(int[] customers, int[] grumpy, int minutes) {
        int length = customers.length;
        int start = 0;
        int end = 0;
        int max = 0; 
        int satisfiedCustormers = 0; 
        int customersWithGrumpy = 0;

        while(end < length) {
            
            if(!isGrumpy(grumpy[end])) {
                satisfiedCustormers += customers[end];
            } else {
                customersWithGrumpy += customers[end];
            }

            if(isSameSizeWithMinutes(start, end, minutes)) {
                max = Math.max(max, customersWithGrumpy);
                if(isGrumpy(grumpy[start])) customersWithGrumpy -= customers[start];
                start++;
            }
            
            end++;
        }

        return max + satisfiedCustormers;

    }

    private boolean isGrumpy(int i){
        return i == GRUMPY;
    }

    private boolean isSameSizeWithMinutes(int start, int end, int minutes){
        return end - start == minutes - 1;
    }
}