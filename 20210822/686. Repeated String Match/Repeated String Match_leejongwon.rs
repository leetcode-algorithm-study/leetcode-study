impl Solution {
    pub fn repeated_string_match(a: String, b: String) -> i32 {
        let mut s = String::new();
        let mut round = 0;

        loop {
            if s.contains(&b) == true {
                return round
            }
            if s.len() >= b.len() {
                break;
            }
            s.push_str(&a.clone());
            round += 1;
        }

        if s.repeat(2).contains(&b) == true {
            round + 1
        } else {
            -1
        }
    }
}