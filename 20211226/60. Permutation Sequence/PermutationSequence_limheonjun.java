/**
 n개로 들 수 있는 모든 순열 중 k번째 값 반환하기

 모든것을 탐색하는 방법은 O(n!)로 시간초과

 1. k를 몇번째 블록의 몇번째 수인지로 변환
 ex)
 n = 3일때
 k = 3

 1       2       3
 1 2 3   2 1 3   3 1 2
 1 3 2   2 3 1   3 2 1

 전체 블록은 (n-1)! * n 개의 블록으로 이루어져 있음
 2개의 블록이 3개 존재

 k = 3이니 3번째에 존재하는 것을 찾아야함
 3 = (3-1)! * 1 + 1
 3 = 2*1 + 1

 즉, 첫번째 블록을 지난 다음블록의 첫번째에 나옴

 마찬가지로 나머지 1에 대해서도 동일한 흐름으로 조사
 k = 1
 1 = (2-1)! * 0 + 1

 0번째 블럭을 지나 첫번째에 나온다는 말은 바로 첫번째에 나온다는 것


 */

class Solution {

    StringBuilder ans = new StringBuilder();

    public String getPermutation(int n, int k) {
        //factorial에 대해 계산된 값
        int fact[] = new int[]{1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

        ArrayList<Integer> list = new ArrayList<Integer>(n + 1);
        for (int i = 1; i <= n; i++) list.add(i);
        solve(list, n, k, fact);
        return ans.toString();
    }

    public void solve(ArrayList<Integer> list, int n, int k, int[] fact) {
        if (n == 1) {
            ans.append(list.get(list.size() - 1));
            return;
        }
        int index = k / fact[n - 1];

        if (k % fact[n - 1] == 0) index--; //나머지가 없다는 것은 skip할 블럭이 없다는 것

        ans.append(list.get(index));
        list.remove(index);
        k = k - fact[n - 1] * index;

        solve(list, n - 1, k, fact);
    }
}