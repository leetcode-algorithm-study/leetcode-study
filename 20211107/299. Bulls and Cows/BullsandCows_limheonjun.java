/**
숫자야구, 스트라이크와 볼이 나온 횟수를 반환

1. 내가 가진 secret과 상대방의 추측 guess를 한 글자씩 분해
2. secret[i]와 guess[i]가 동일하면 스트라이크
3. secret[i]와 guess[i]가 다르면 각각의 맵에 저장(위치는 다르더라도 같은 수가 나온 경우 비교하기 위함)
4. 추측한 숫자값을 갖고 있는 경우 secretMap과 guessMap중 작은 숫자가 있는 곳을 반환 

시간복잡도
secret의 길이 : n
첫번째 for => n
두번째 for => n
O(2n) => O(n)
*/
class Solution {
    public String getHint(String secret, String guess) {
        Map<String, Integer> secretMap = new HashMap<>();
        Map<String, Integer> guessMap = new HashMap<>();

        int strike = 0;
        int ball = 0;

        String splitSecret[] = secret.split("");
        String splitGuess[] = guess.split("");

        for(int i=0; i< splitSecret.length; i++) {
            if(splitSecret[i].equals(splitGuess[i])) {
                strike++;
            } else {
                secretMap.put(splitSecret[i], secretMap.getOrDefault(splitSecret[i], 0)+1);
                guessMap.put(splitGuess[i], guessMap.getOrDefault(splitGuess[i], 0)+1);
            }
        }

        for(String key : guessMap.keySet()) {
            if(secretMap.containsKey(key)) {
                ball += guessMap.get(key) < secretMap.get(key) ? guessMap.get(key) : secretMap.get(key) ;
            }
        }

        return strike + "A" + ball + "B";
    }
}