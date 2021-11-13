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
    pub fn rotate_right(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
        let mut v: Vec<i32> = Vec::new();
        let mut node = &head;
        while let Some(n) = node {
            v.push(n.val);
            node = &n.next;
        }
        if v.len() == 0
        {
            return None;
        }
        //#> [1,2,3,4,5]

        //calc rotate index
        let k = k as usize % v.len();
        let mut result = None;

        //
        for value in v.iter().take(v.len() - k).rev() {
            result = Some(Box::new(ListNode {
                val: *value,
                next: result
            }))
        }
        //#> [1,2,3]

        //roated parts
        for value in v.iter().rev().take(k) {
            result = Some(Box::new(ListNode {
                val: *value,
                next: result
            }))
        }
        //#> [5,4,1,2,3]

        result
    }
}