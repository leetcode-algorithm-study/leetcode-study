impl Solution {
    pub fn longest_palindrome(mut s: String) -> i32 {
        let mut result = 0;
        let mut extra = 0;

        loop {
            if s.len() == 0 {
                break;
            }
            let before = s.len();
            let ch = s.chars().into_iter().next().unwrap();
            s.retain(|x| {
                x != ch
            });
            let after = before - s.len();

            extra |= after & 1; // if after is 1111, then, extra | (1111 & 0001)
            result += after & !1; // if after is 1111, then, result += 1111 & 1110(="~(0001)")
        }

        (result + extra) as i32
    }
}