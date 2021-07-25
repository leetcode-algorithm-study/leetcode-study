use std::collections::HashSet;

impl Solution {
    pub fn find_repeated_dna_sequences(s: String) -> Vec<String> {
        if s.len() <= 10 {
            return vec![];
        }

        let mut all: HashSet<&str> = HashSet::new();
        let mut rep: HashSet<&str> = HashSet::new();

        //window
        let mut l = 0;
        let mut r = 10;

        while r <= s.len() {
            if all.contains(&s[l..r]) {
                rep.insert(&s[l..r]);
            } else {
                all.insert(&s[l..r]);
            }
            l += 1;
            r += 1;
        }

        let ret = rep.iter().map(|i| i.to_string()).collect::<Vec<String>>();
        ret
    }
}