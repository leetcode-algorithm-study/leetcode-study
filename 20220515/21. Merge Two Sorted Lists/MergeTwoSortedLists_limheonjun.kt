class Solution {
    fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {
        var head1 = list1
        var head2 = list2
        var dummyHead = ListNode(-101)
        var result = dummyHead
        
        while(head1 != null && head2 != null) {
            if(head1.`val` > head2.`val`) {
                dummyHead.next = head2
                head2 = head2.next
            } else {
                dummyHead.next = head1
                head1 = head1.next
            }
            dummyHead = dummyHead.next
        }
        
        while(head1 != null) {
            dummyHead.next = head1
            head1 = head1.next
            dummyHead = dummyHead.next
        }
        
        while(head2 != null) {
            dummyHead.next = head2
            head2 = head2.next
            dummyHead = dummyHead.next
        }
        
        return result.next        
    }
}