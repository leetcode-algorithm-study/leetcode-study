/**
search메소드로 MagicDictionary안에서 단 한글자만 다른 단어가 존재하는지 찾기

1. 길이를 key로, 문자열을 갖는 Set을 value로 map 구성
2. search 호출 시 word의 길이와 동일한 길이가 존재하지 않으면 false 반환
3. 길이가 같다면 길이에 해당하는 Set<String>을 불러옴
4. Set의 모든 원소를 돌아가며 Set원소의 문자와 word의 문자가 1개만 다른 경우 true반환
5. 그렇지 않은 경우 false 반환

시간복잡도
dict의 개수 : n
search하는 단어의 개수 : m
문자열의 최대 길이 : k

buildDict => n
search => nk
동일한 길이에 최대 n개가 들어가 있을 수 있고, 
맨 마지막 글자만 다르다고 할 시 문자열의 길이 만큼 확인 k

O(n + nk)
*/
class MagicDictionary {
    
    Map<Integer, Set<String>> map;
        
    public MagicDictionary() {
        map = new HashMap<>();
    }
    
    public void buildDict(String[] dict) {
        for (String s : dict) {
            int len = s.length();
            if (!map.containsKey(len)) {
                map.put(len, new HashSet<>());
            }
            map.get(len).add(s);
        }
    }
    

    public boolean search(String word) {
        int len = word.length();
        if (!map.containsKey(len)) {
            return false;
        }
        for (String s : map.get(len)) { //Set<String>
            int count = 0;
            for (int i = 0; i < len; i++) {
                if (word.charAt(i) != s.charAt(i)) {
                    count++;
                }
            }
            if (count == 1) {
                return true;
            }
        }
        return false;
    }
}