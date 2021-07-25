use std::cmp;

impl Solution {
    pub fn min_sub_array_len(target: i32, nums: Vec<i32>) -> i32 {

        if nums.len() == 0 {
            return 0;
        }

        let mut l: usize = 0;
        let mut r: usize = 1;
        let mut sum = nums[0];
        let mut min: usize = nums.len() + 1;

        while r <= nums.len() {
            if sum >= target {
                min = cmp::min(min, r - l);
                sum -= nums[l];
                l += 1;
            } else {
                r += 1;
                if r > nums.len() {
                    break;
                }
                sum += nums[r-1];
            }
        }

        if min > nums.len() {
            min = 0;
        }

        min as i32
    }
}