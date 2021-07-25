use std::collections::HashMap;

impl Solution {
    pub fn contains_nearby_duplicate(nums: Vec<i32>, k: i32) -> bool {
        let mut map = HashMap::new();

        for (i, num) in nums.iter().enumerate() {
            if let Some(j) = map.insert(num, i) {
                if (i as i32) - (j as i32) <= k {
                    return true;
                }
            }
        }
        false
    }
}