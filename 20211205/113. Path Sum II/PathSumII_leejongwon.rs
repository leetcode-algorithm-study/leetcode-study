// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
//
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::rc::Rc;
use std::cell::RefCell;
impl Solution {
    pub fn path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> Vec<Vec<i32>> {
        // left, right 에서 targetSum 나오는 경로가 한개씩 보장된건가? No
        // left 엔 없고, right 엔 있으면 [], [...]  이런식으로 출력하면 되나? (반대로 마찬가지) ok
        let mut result = vec![];

        dfs(root, target_sum, &mut vec![], &mut result);

        result
    }
}

fn dfs(node: Option<Rc<RefCell<TreeNode>>>, target_sum: i32, values: &mut Vec<i32>, result: &mut Vec<Vec<i32>>) {

    if let Some(node) = node {
        let node = node.borrow();
        let acc = (values.iter().sum::<i32>() + node.val) as i32;

        //**depth**
        values.push(node.val);

        match (node.left.clone(), node.right.clone()) {
            (Some(p), Some(q)) => {
                dfs(Some(p), target_sum, values, result);
                dfs(Some(q), target_sum, values, result);
            }
            (Some(p), _) => {
                dfs(Some(p), target_sum, values, result);
            }
            (_, Some(q)) => {
                dfs(Some(q), target_sum, values, result);
            }
            (_, _) => {
                if acc == target_sum {
                    result.push(values.clone());
                }
            }
        }

        //**depth**
        values.pop();
    }
}