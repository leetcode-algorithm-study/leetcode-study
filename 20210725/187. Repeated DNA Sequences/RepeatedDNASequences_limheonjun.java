class Solution {
    public List<String> findRepeatedDnaSequences(String s) {
        int start = 0;
        int end = 0;
        int windowSize = 10;
        int length = s.length();
        Set<String> result = new HashSet<>();
        StringBuilder sb = new StringBuilder();
        Map<String, Integer> map = new HashMap<>();

        while(end < length){
            sb.append(s.charAt(end));
            
            if(isSameAsWindowSize(start, end, windowSize)){
                // AAAAACCCCC
                String key = sb.subSequence(start, end+1).toString();
                Integer count = map.getOrDefault(key, 0) + 1;
                if(count >= 2) result.add(key);
                map.put(key, count);
                start++;
            }
            end++;
        }

        return result.stream().collect(Collectors.toList());
    }

    private boolean isSameAsWindowSize(int start, int end, int windowSize){
        return end - start == windowSize-1;
    }
}