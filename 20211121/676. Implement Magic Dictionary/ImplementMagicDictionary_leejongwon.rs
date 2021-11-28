#[derive(Default)]
pub struct Trie {
    children: [Option<Box<Trie>>; 26],
    is_word: bool
}

#[derive(Default)]
pub struct MagicDictionary {
    pub trie: Trie
}

impl MagicDictionary {

    pub fn new() -> Self {
        Default::default()
    }

    pub fn build_dict(&mut self, dictionary: Vec<String>) {
        for word in dictionary {
            let mut current = &mut self.trie;

            for char in word.as_bytes() {
                let index = (char - b'a') as usize;
                current = current.children[index].get_or_insert(Box::new(Trie::default()));
            }

            current.is_word = true;
        }
    }

    pub fn search(&self, mut search_word: String) -> bool {
        let mut search_word_bytes = unsafe { search_word.as_bytes_mut() };

        for search_index in 0..search_word_bytes.len() {
            for char_byte in b'a'..=b'z' {
                if search_word_bytes[search_index] == char_byte {
                    continue;
                }

                //magic
                let tmp = search_word_bytes[search_index];
                search_word_bytes[search_index] = char_byte;

                if MagicDictionary::magic(search_word_bytes, &self.trie) {
                    return true;
                }

                search_word_bytes[search_index] = tmp;
            }
        }

        false
    }

    fn magic(v: &[u8], trie: &Trie) -> bool {
        let mut cur = trie;
        for ch in v {
            if cur.children[(ch - b'a') as usize].is_none() {
                return false;
            }
            cur = cur.children[(ch - b'a') as usize].as_ref().unwrap();
        }
        cur.is_word
    }
}

