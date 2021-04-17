/*
    Runtime: 83 ms
    Memory Usage: 38 MB
*/
class Solution {
    public int numSquares(int n) {
        int count[] = new int[n+1];
        count[1] = 1;

        for(int i=2; i<=n; i++) {
            count[i] = Integer.MAX_VALUE;

            int val = (int) Math.pow((int)Math.sqrt(i), 2);
            if(val == i) {
                count[i] = 1;
                continue;
            }

            int sqrt = (int)Math.sqrt(i);
            for(int j=1; j<=sqrt; j++) {
                int pow = (int)Math.pow(j,2);
                count[i] = Math.min(count[i], count[pow] + count[i-pow]);
            }
        }
        
        return count[n];
    }
}