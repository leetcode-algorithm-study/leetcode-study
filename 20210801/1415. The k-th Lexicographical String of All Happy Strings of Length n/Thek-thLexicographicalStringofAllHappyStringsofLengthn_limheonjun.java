class Solution {
    private List<String> happyString = new ArrayList<>();
    private char alphabet[] = {'a', 'b', 'c'};

    public String getHappyString(int n, int k) {
        String result = "";
        int count = 0;

        for(int i=0; i<3; i++){
            findAllHappyStrings(n, 1, new StringBuilder().append(alphabet[i]));
        }

        Collections.sort(happyString);

        return happyString.size() < k ? "" : happyString.get(k-1);
    }

    private void findAllHappyStrings(int n, int count, StringBuilder sb){
        if(count >= n) {
            happyString.add(sb.toString());
            sb.deleteCharAt(count-1);
            return;
        }

        for(int i=0; i<3; i++){
            if(sb.charAt(count-1) != alphabet[i]){
                findAllHappyStrings(n, count+1, sb.append(alphabet[i]));
            }
        }

        sb.deleteCharAt(count-1);
    }
}