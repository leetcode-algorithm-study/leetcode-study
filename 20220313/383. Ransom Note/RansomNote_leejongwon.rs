impl Solution {
    pub fn can_construct(ransom_note: String, magazine: String) -> bool {

        let mut alphabetCache = vec![0; 26];

        for ch in magazine.chars() {
            let index = (ch as usize) - b'a' as usize;
            alphabetCache[index] = alphabetCache[index] + 1;
        }

        for ch in ransom_note.chars() {
            let index = (ch as usize) - b'a' as usize;
            if alphabetCache[index] <= 0 {
                return false;
            }
            alphabetCache[index] = alphabetCache[index] - 1;
        }

        true
    }
}