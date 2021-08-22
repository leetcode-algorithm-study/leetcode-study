class Solution {
    public int repeatedStringMatch(String a, String b) {
        int length = (b.length()/a.length())+2;
        StringBuilder sb = new StringBuilder();
        for(int i=1; i<=length; i++){
            if(sb.append(a).toString().contains(b)) return i;
        }
        
        return -1;
    }
}