// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
//
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
impl Solution {
    pub fn delete_duplicates(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut result = ListNode::new(0);
        let mut result_iter = &mut result;
        let mut pre_val = -101;

        let mut head= head.as_ref();

        while let Some(node) = head {
            if pre_val != node.val {
                result_iter.next = Some(Box::new(ListNode::new(node.val)));
                result_iter = result_iter.next.as_mut().unwrap();
                pre_val = node.val
            }

            head = node.next.as_ref();
        }

        result.next
    }
}