use std::cmp::max;
use std::i32;

impl Solution {
    pub fn max_rotate_function(mut nums: Vec<i32>) -> i32 {
//         if a.len() == 0 {
//             return 0;
//         }

//         (1..nums.len() + 1).map(|_| {
//             nums.rotate_right(1);
//             nums.iter().enumerate().map(|(i, n)| i as i32 * *n).sum::<i32>()
//         }).fold(i32::MIN, |acc, cur| max(acc, cur))

        let len = nums.len() as i32;
        if (nums.len() == 0) {
            return 0;
        }

        let mut factor = 0 as i32;
        let mut sum = 0 as i32;
        for i in 0..len {
            factor += nums[i as usize];
            sum += nums[i as usize] * i;
        }

        let mut result = sum;
        let rotator = len;
        for i in 1..len {
            sum = sum - factor + (nums[i as usize - 1] * rotator);
            result = max(result, sum);
        }
        result
    }
}
