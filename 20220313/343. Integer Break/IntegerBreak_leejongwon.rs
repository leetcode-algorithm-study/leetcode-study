use std::cmp;

impl Solution {
    pub fn integer_break(n: i32) -> i32 {
        let mut cache = vec![0 as i32; (n + 1) as usize];
        Self::dfs(n, &mut cache)
    }

    pub fn dfs(n: i32, cache: &mut Vec<i32>) -> i32 {
        if n <= 2 {
            return 1;
        }
        if cache[n as usize] > 0 {
            return cache[n as usize];
        }

        let mut answer = 1 * (n-1);
        for first in 2..n {
            let second = n - first;
            let product = first * cmp::max(second, Self::dfs(second, cache));

            if answer < product {
                answer = product;
            }
        }

        cache[n as usize] = answer;
        answer
    }
}