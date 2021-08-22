public class Solution {

    public static int repeatedStringMatch(String a, String b) {
        StringBuilder str=new StringBuilder();
        int count=0;

        while(str.toString().length() < a.length()+b.length() ){
            if(str.toString().contains(b))
                return count;
            str.append(a);
            count++;
        }
        return -1;
    }

    public static void main(String[] args) {
        repeatedStringMatch("abcd","cdabcdab");
    }
}
