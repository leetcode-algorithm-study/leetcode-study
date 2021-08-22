class Solution {
    public boolean repeatedSubstringPattern(String s) {
        String str = "";

        for(int i=1; i<s.length(); i++){
            if(s.length()%i != 0) continue;
            str = s.substring(0, i);
            for(int j=1; j<s.length()/i; j++){
                String temp = s.substring(i*j, i*j+i);
                if(!str.equals(temp)) break; //다른경우 바로 break;
                if(j == s.length()/i-1) return true;
            }
        }

        return false;
    }
}