use std::rc::Rc;
use std::cell::RefCell;

// Definition for a binary tree node.
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    #[inline]
    pub fn new(val: i32) -> Self {
        TreeNode {
            val,
            left: None,
            right: None
        }
    }
}

pub struct BSTIterator {
    stack: Vec<Rc<RefCell<TreeNode>>>
}

impl BSTIterator {
    pub fn new(root: Option<Rc<RefCell<TreeNode>>>) -> Self {
        let mut node = root;
        let mut stack = Vec::new();
        while let Some(inner) = node.clone() {
            stack.push(inner.clone());
            node = node.unwrap().borrow().left.clone();
        }
        BSTIterator{
            stack,
        }
    }

    pub fn next(&mut self) -> i32 {
        let node = self.stack.pop().unwrap();
        let res = node.borrow().val;
        let mut next = node.borrow().right.clone();
        while let Some(inner) = next.clone() {
            self.stack.push(inner.clone());
            next = next.unwrap().borrow().left.clone();
        }
        res
    }

    pub fn has_next(&self) -> bool {
        self.stack.is_empty() == false
    }
}
