impl Solution {
    pub fn camel_match(queries: Vec<String>, pattern: String) -> Vec<bool> {
        let mut result: Vec<bool> = vec![];
        let patterns: Vec<String> = split_by_camel(pattern.clone());

        result = queries.iter().map(|query| -> bool {
            let tokens = split_by_camel(query.clone());

            let mut tokens = tokens.iter();
            let mut patterns = patterns.iter();

            loop {
                match (tokens.next(), patterns.next()) {
                    (Some(token), Some(pattern)) => {
                        let mut token = token.clone();
                        for ch in pattern.chars() {
                            if let Some(pos) = token.find(ch) {
                                token.remove(pos);
                            } else {
                                return false;
                            }
                        }
                    },
                    (Some(token), _) => return false,
                    (_, Some(pattern)) => return false,
                    (_, _) => break
                };
            }

            true
        }).collect();

        result
    }
}

//eeeFooBarTest => ["Foo", "Bar", "Test"]
fn split_by_camel(s: String) -> Vec<String> {
    let mut split: Vec<String> = vec![];
    let mut token = String::new();

    for (i, ch) in s.chars().enumerate() {
        if ch.is_uppercase() && i != 0 {
            split.push(token.clone());
            token.truncate(0);
        }
        token.push(ch);
    }
    if token.is_empty() == false {
        split.push(token.clone());
    }

    split.into_iter().filter(|a| {
        a.chars().any(|c|  matches!(c, 'A'..='Z'))
    }).collect::<Vec<String>>()
}