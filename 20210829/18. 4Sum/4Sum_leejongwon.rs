use std::collections::HashSet;

pub fn four_sum(nums: Vec<i32>, target: i32) -> Vec<Vec<i32>> {
    let mut nums = nums;
    nums.sort_unstable();

    let mut result:HashSet<Vec<i32>> = HashSet::new();


    for (i, &num1) in nums[..].iter().enumerate() {
        for (j, &num2) in nums[i+1..].iter().enumerate() {
            for (k, &num3) in nums[i+j+2..].iter().enumerate() {
                for (s, &num4) in nums[i+j+k+3..].iter().enumerate() {
                    if num1 + num2 + num3 + num4 == target {
                        let element = vec![num1, num2, num3, num4];
                        if result.contains(&element) == false {
                            result.insert(element);
                        }
                        if nums.first() == nums.last() {
                            return result.into_iter().collect::<Vec<Vec<i32>>>();
                        }
                    }
                }
            }
        }
    }

    result.into_iter().collect::<Vec<Vec<i32>>>()
}