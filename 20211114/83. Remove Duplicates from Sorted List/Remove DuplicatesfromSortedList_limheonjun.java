/**
 * 링크드 리스트에서 중복된 노드를 한개만 남기기
 *
 * 투포인터
 * 1. 두 개의 포인터 start와 end
 * 2. start와 end의 값이 같으면 end포인터 증가
 * 3. start와 end의 값이 다르면 start.next에 end를 할당함으로써 중복 제거 후 start에 end 할당
 * 4. 반복문이 종료된 후 start부터 end까지 동일한 숫자가 나온 경우 마지막 노드들은 중복이 제거 되지 않았을 수 있기 때문에 start.next에 end를 할당
 *
 * 시간복잡도
 * 노드의 개수 : n
 * while문 => n
 * O(n)
 */
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        if(head == null) return head;

		ListNode start = head;
		ListNode end = head;
		while(end != null) {
			if(start.val != end.val) {
				start.next = end;
				start = end;
			}
			end = end.next;
		}
		start.next = end;

		return head;
    }
}