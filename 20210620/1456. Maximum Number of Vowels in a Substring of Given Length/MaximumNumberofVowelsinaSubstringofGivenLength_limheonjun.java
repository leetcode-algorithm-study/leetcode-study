class Solution {
    public int maxVowels(String s, int k) {
        int strlength = s.length();
        int windowSize = k;
        int count = 0;
        int max = 0;
        int start = 0;
        int end = 0;

        while(end < strlength) {
            char c = s.charAt(end);
            if(isVolwel(c)) count++;
            if(isSameSizeWithWindow(start, end, windowSize)){
                max = Math.max(max, count);
                count -= isVolwel(s.charAt(start++)) ? 1 : 0;
            }
            end++;
        }

        return max;
    }

    private boolean isSameSizeWithWindow(int start, int end, int windowSize) {
        return end - start == windowSize - 1;
    }

    private boolean isVolwel(char c) {
        if(c == 'a') return true;
        if(c == 'e') return true;
        if(c == 'i') return true;
        if(c == 'o') return true;
        if(c == 'u') return true;
        return false;
    }
}