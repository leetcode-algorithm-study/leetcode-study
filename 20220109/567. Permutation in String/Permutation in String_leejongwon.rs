impl Solution {
    pub fn check_inclusion(s1: String, s2: String) -> bool {
        //
        let s2: &[u8] = s2.as_bytes();
        let mut s1_counter = [0u8; 26];
        let mut s2_counter = [0u8; 26];
        let idx = |c: u8| { (c - 'a' as u8) as usize };

        for c in s1.chars() {
            s1_counter[idx(c as u8)] += 1;
        }

        //
        for i in 0..s2.len() {
            s2_counter[idx(s2[i])] += 1;
            if i >= s1.len() - 1 {
                if s1_counter == s2_counter {
                    return true;
                }
                s2_counter[idx(s2[i - s1.len() + 1])] -= 1;
            }
        }

        false
    }
}