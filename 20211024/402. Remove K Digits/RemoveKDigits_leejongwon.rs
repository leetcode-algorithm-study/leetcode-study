impl Solution {
    pub fn remove_kdigits(num: String, mut k: i32) -> String {
        let mut result = String::with_capacity(num.len());

        for char in num.chars() {
            //result 마지막하고 num 처음하고 반복 비교
            while k > 0 && result.is_empty() == false && result.chars().last().unwrap() > char {
                result.pop();
                k -= 1;
            }

            if result.is_empty() == true && char == '0' {
                continue;
            }

            result.push(char); // '572474776', k=3.   244776
        }

        // 남은 k 처리. ex) "9", k=1
        for _ in 0..k {
            result.pop();
        }

        if result.is_empty() == true {
            return String::from("0");
        }
        result
    }
}