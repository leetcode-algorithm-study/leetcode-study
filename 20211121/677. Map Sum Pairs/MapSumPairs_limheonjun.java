/**
 * prefix로 시작하는 key의 value를 모두 더한 값을 반환하기
 * 
 * insert
 * - 동일한 키가 존재하는 경우 해당 키를 삭제하고 다시 insert
 * 
 * sum
 * - map의 key를 순회하며 prefix로 시작하는 키가 있는지 찾고 값을 합산하여 반환
 *
 * 시간복잡도
 * 문자열의 개수 n
 * insert => 1 // 모든 문자열 insert => n
 * sum => n
 * O(2n) => O(n)
 */
class MapSum {

    private Map<String, Integer> map = new HashMap<>();

	public MapSum() {

	}

	public void insert(String key, int val) {
        if(map.containsKey(key)) map.remove(key);
		map.put(key, val);
	}

	public int sum(String prefix) {
		int sum = 0;
		for(String key : map.keySet()) {
			if(key.startsWith(prefix)) {
				sum += map.get(key);
			}
		}

		return sum;
	}
}