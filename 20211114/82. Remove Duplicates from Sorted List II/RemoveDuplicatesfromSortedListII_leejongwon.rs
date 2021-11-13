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

        let mut head= head.as_ref();
        let mut last_visited_node = ListNode::new(-101);

        while let Some(node) = head {
            // check before appending node
            // => previous node: last_visited_node / current node: node / next node: node.next
            let previous_nodes_condition = node.next.is_some() && node.clone().next.unwrap().val != node.val && last_visited_node.val != node.val;
            let last_node_condition = (node.next.is_none() && last_visited_node.val != node.val);

            if previous_nodes_condition || last_node_condition {
                result_iter.next = Some(Box::new(ListNode::new(node.val)));
                result_iter = result_iter.next.as_mut().unwrap();
            }

            last_visited_node.val = node.val;
            head = node.next.as_ref();
        }

        result.next
    }
}