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
use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn sort_list(mut head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let current = &mut head;
        let mut heap = BinaryHeap::new();
        while let Some(node) = current {
            // println!("node val: {}", node.val);
            heap.push(Reverse(node.val)); //asc
            *current = node.next.take();
        }

        let mut new_head: Option<Box<ListNode>> = None;
        let mut current: &mut Option<Box<ListNode>> = &mut None;

        while heap.is_empty() == false {
            let new_node = Some(Box::new(ListNode::new(heap.pop().unwrap().0))); //1,2,3,4

            match current {
                Some(inner) => {
                    // println!("valid_node val: {}", valid_node.val);
                    inner.next = new_node;
                    current = &mut inner.next;
                }
                None => {
                    new_head = new_node;
                    current = &mut new_head;
                }
            }
        }

        new_head
    }
}