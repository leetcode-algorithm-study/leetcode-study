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
    pub fn merge_nodes(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut result = ListNode::new(0);
        let mut result_iter = &mut result;

        let mut head= head.as_ref();
        let mut sum = 0;

        while let Some(node) = head  {
            sum += node.val;
            if node.val == 0 && sum != 0 {
                result_iter.next = Some(Box::new(ListNode::new(sum)));
                result_iter = result_iter.next.as_mut().unwrap();

                sum = 0;
            }

            head = node.next.as_ref();
        }

        result.next
    }
}