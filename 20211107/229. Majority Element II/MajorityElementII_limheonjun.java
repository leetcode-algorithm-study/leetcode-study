/**
(nums의 사이즈/3)보다 많이 나타나는 모든 원소를 구하여라

1. 배열의 원소에 순차적으로 접근
2. 배열의 원소가 나온 횟수를 map에 저장
3. 저장된 원소가 n/3보다 큰 경우 set에 저장
4. set을 list형태로 변환하여 반환

시간복잡도
nums의 길이 : n
for => n
set.stream().collect => n
O(2n) => O(n)
*/
class Solution {
    public List<Integer> majorityElement(int[] nums) {
        Set<Integer> set = new HashSet<>();
        Map<Integer, Integer> map = new HashMap<>();
        for(int num : nums) {
            map.put(num, map.getOrDefault(num, 0)+1);
            if(nums.length/3 < map.get(num)) {
                set.add(num);
            }
        }

        return set.stream().collect(Collectors.toList());
    }
}