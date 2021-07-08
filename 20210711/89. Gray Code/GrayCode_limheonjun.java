/**
 * Runtime: 136 ms, faster than 5.05% of Java online submissions for Gray Code.
 * Memory Usage: 46.1 MB, less than 77.57% of Java online submissions for Gray Code.
 */

class Solution {
        public List<Integer> grayCode(int n) {
        List<Integer> result = new ArrayList<>();
        int length = (int) Math.pow(2, n);

        for(int i=0; i<length; i++){
            int grayCode = getGrayCode(i, n);
            result.add(grayCode);
        }

        return result;
    }

    private int getGrayCode(int decimal, int n){
        int result = 0;
        
        int msb = getMsb(decimal, n);
        result += getDecimal(msb, n-1);
        
        for(int i=0; i<n-1; i++){
            int firstBit = getNthBit(decimal, (n-1-i));
            decimal -= getDecimal(firstBit, (n-1)-i);
            int secondBit = getNthBit(decimal,(n-1)-i-1);
            int xorBit = getXorBit(firstBit, secondBit);
            result += getDecimal(xorBit, (n-1)-i-1);
        }
        
        return result;
    }

    private int getMsb(int decimal, int n) {
        return decimal / (int) Math.pow(2, n-1);
    }
    
    private int getDecimal(int bit, int n){
        return bit * (int) Math.pow(2, n);
    }
    
    private int getNthBit(int decimal, int n){
        return decimal / (int) Math.pow(2, n);
    }
    
    private int getXorBit(int first, int second){
        return first ^ second;
    }
}