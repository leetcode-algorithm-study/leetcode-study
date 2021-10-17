impl Solution {
    pub fn str_str(haystack: String, needle: String) -> i32 {
        let a = match haystack.find(&needle) {
            Some(v) => v as i32,
            None => -1
        };
        a as i32
    }
}