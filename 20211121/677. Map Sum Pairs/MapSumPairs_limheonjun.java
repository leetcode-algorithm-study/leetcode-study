/**
prefix가 존재하면, prefix에 해당하는 모든 단어의 값의 합을 반환

1. insert를 통해 key와 value를 할당
2. sum의 인자가 map의 key의 prefix라면 합을 계산

시간복잡도
insert할 key와 value데이터 : n
sum의 호출 횟수 : m

insert => m
sum => prefix가 apple, appl, app, ap, a일때 insert한 데이터가 모두 applea, appleb, applec, applec, apple... 인 경우
mn

O(m+nm)
*/
class MapSum {

    private Map<String, Integer> map = new HashMap<>();

	public MapSum() {

	}

	public void insert(String key, int val) {
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