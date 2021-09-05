use std::cmp::Ordering;

pub fn three_sum_closest(nums: Vec<i32>, target: i32) -> i32 {
    let mut nums = nums;
    nums.sort();

    let mut diff = std::i32::MAX;
    let mut sum = std::i32::MIN;

    for pivot in 0..nums.len() - 2 {
        let mut left = pivot + 1;
        let mut right = nums.len() - 1;

        while left < right {
            let curr_sum = nums[pivot] + nums[left] + nums[right];
            let curr_diff = target - curr_sum;

            match curr_diff.cmp(&0) {
                Ordering::Equal => {
                    return curr_sum;
                }
                Ordering::Greater => {
                    left += 1;
                },
                Ordering::Less => {
                    right -= 1;
                },
            }

            if i32::abs(curr_diff) < diff {
                diff = i32::abs(curr_diff);
                sum = curr_sum;
            }
        }
    }
    sum
}