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
    pub fn insertion_sort_list(mut head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        if head.is_none() {
            return head;
        }

        let mut head = head;
        let mut new_head = ListNode::new(0);

        while let Some(mut boxed) = head.take() {
            head = boxed.next.take();
            let mut new_head_ptr = &mut new_head;

            //find insertion pos
            while new_head_ptr.next.as_ref().is_some() && new_head_ptr.next.as_ref().unwrap().val < boxed.val {
                new_head_ptr = new_head_ptr.next.as_mut().unwrap();
            }

            boxed.next = new_head_ptr.next.take();
            new_head_ptr.next = Some(boxed);
        }

        new_head.next
    }
}