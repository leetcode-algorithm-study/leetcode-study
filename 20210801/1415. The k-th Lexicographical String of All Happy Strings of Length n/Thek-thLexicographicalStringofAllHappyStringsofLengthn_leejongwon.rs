impl Solution {
    pub fn get_happy_string(n: i32, k: i32) -> String {
        let mut stuffs: Vec<String> = vec![];
        stuffs.push(String::from("a"));
        stuffs.push(String::from("b"));
        stuffs.push(String::from("c"));

        while stuffs.first().unwrap().len() < n as usize {
            for char in "abc".chars() {
                if let Some(mut first) = stuffs.first().cloned() {
                    if first.chars().last().unwrap() != char {
                        first.push(char);
                        stuffs.push(first.to_string());
                    }
                }
            }
            stuffs.remove(0);
        }

        if stuffs.len() < k as usize {
            "".to_string()
        } else {
            stuffs.get(k as usize - 1).unwrap().to_string()
        }
    }
}
