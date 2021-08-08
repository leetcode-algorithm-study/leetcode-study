impl Solution {
    pub fn ambiguous_coordinates(s: String) -> Vec<String> {
        let stuff: &str = &s[1..s.len()-1];
        let mut result: Vec<String> = vec![];

        for pivot in 1..stuff.len() {
            let xParts = Self::split(&stuff[..pivot]);
            let yParts = Self::split(&stuff[pivot..]);

            for xPart in xParts.iter() {
                for yPart in yParts.iter() {
                    result.push(format!("({}, {})", xPart, yPart));
                }
            }
        }

        result
    }

    pub fn split(s: &str) -> Vec<String> {
        let mut result: Vec<String> = vec![];

        let l = s.chars().next().unwrap();
        let r = s.chars().last().unwrap();

        match [l, r] {
            ['0', '0'] => { // 0...0(x), only enable '0'
                if s.len() == 1 {
                    result.push("0".to_string());
                }
            },
            ['0', _] => { // 0.(.+)%d enabled, 00(.+)%d or 00.(.+)%d disabled.
                result.push(format!("0.{}", &s[1..]));
            },
            [_, '0'] => { // 1.0 (x)
                result.push(s.to_string());
            },
            _ => {
                for pivot in 1..s.len() {
                    result.push(format!("{}.{}", &s[..pivot], &s[pivot..]));
                }
                result.push(s.to_string());
            }
        }

        result
    }
}

