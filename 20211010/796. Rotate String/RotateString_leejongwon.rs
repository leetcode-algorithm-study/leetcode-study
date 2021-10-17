impl Solution {
    pub fn rotate_string(s: String, goal: String) -> bool {
        if s.len() != goal.len() {
            return false;
        }

        match s.repeat(2).find(&goal) {
            Some(_) => true,
            None => false
        }
    }
}