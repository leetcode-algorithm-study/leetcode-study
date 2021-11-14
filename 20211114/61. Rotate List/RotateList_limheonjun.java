/**
 * k번만큼 제일 오른쪽에 있는 수를 제일 왼쪽으로 붙이기
 *
 * 1. 제일 마지막노드(tail)을 찾음
 * 2. 양방향 연결리스트가 아니기 때문에 tail로부터 이전 노드를 찾아갈 수 없음
 *    따라서 노드의 수를 size라 할때 size - (size % k)만큼 head를 tail.next에 붙임으로써 동일한 효과
 *
 * 시간복잡도
 * 노드의 길이 : n
 * getTail => n
 * count => n
 * O(2n) => O(n)
 */
class Solution {
    private int size = 1;

	public ListNode rotateRight(ListNode head, int k) {
		if(head == null) return head;

		ListNode tail = getTail(head);
		int count = size-(k%size);
        
		while(count > 0) {
			tail.next = head;
			tail = tail.next;
			head = head.next;
			tail.next = null;
			count--;
		}

		return head;

	}

	private ListNode getTail(ListNode head) {
		while(head.next != null) {
			size++;
			head = head.next;
		}
		return head;
	}
}