/**
(nums의 사이즈/2)보다 많이 나타나는 원소를 구하여라

1. 배열의 원소에 순차적으로 접근
2. 배열의 원소가 나온 횟수를 map에 저장
3. 저장된 원소가 n/2보다 큰 경우 result에 결과값 반환
4. result 반환

시간복잡도
nums의 길이 : n
for => n
O(n)
*/
class Solution {
    public int majorityElement(int[] nums) {
        int result = 0;
        Map<Integer, Integer> map = new HashMap<>();
        for(int num : nums) {
            map.put(num, map.getOrDefault(num, 0)+1);
            if(nums.length/2 < map.get(num)) {
                result = num;
                break;
            }
        }

        return result;
    }
}