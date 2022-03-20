impl Solution {
    pub fn single_number(nums: Vec<i32>) -> i32 {
        //4ms
        // let mut ans = 0;
        // for num in nums {
        //     ans = ans ^ num;
        // }
        // ans
        
        //4ms
        // let mut ans = 0;
        // for &num in nums.iter() {
        //     ans = ans ^ num;
        // }
        // ans
        
        //0ms
        nums.iter().fold(0, |acc, v| acc^v)
    }
}