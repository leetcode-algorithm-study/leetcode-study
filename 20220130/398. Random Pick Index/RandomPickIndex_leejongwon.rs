use rand::seq::SliceRandom;
use std::collections::HashMap;

struct Solution {
    map: HashMap<i32, Vec<i32>>
}


/**
  * `&self` means the method takes an immutable reference
  * If you need a mutable reference, change it to `&mut self` instead
  */
impl Solution {

    fn new(nums: Vec<i32>) -> Self {
        let mut map = HashMap::new();

        for (i, n) in nums.into_iter().enumerate() {
            (*map.entry(n).or_insert(vec![])).push(i as i32);
        }

        Self {
            map
        }
    }

    fn pick(&self, target: i32) -> i32 {
        *self
            .map
            .get(&target)
            .unwrap()
            .choose(&mut rand::thread_rng())
            .unwrap()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution::new(nums);
 * let ret_1: i32 = obj.pick(target);
 */