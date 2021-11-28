#[derive(Default)]
pub struct Trie {
    children: [Option<Box<Trie>>; 26],
    is_word: bool
}

impl Trie {
    pub fn new() -> Self {
        Default::default()
    }

    pub fn insert(&mut self, word: String) {
        let mut current = self;
        for word_char in word.chars() {
            let idx = (word_char as u8 - 'a' as u8) as usize;
            current = current.children[idx].get_or_insert(Box::new(Trie::new()));
        }
        current.is_word = true;
    }

    pub fn retrieve(&self, word: &str) -> Option<String> {
        let mut current = self;
        let mut root_word = String::with_capacity(word.len());

        for word_char in word.chars() {
            let idx = (word_char as u8 - 'a' as u8) as usize;
            match current.children[idx].as_ref() {
                Some(trieNode) => {
                    current = trieNode;
                },
                None => {
                    return None;
                }
            }

            root_word.push(word_char);
            if current.is_word == true {
                return Some(root_word)
            }
        }

        None
    }
}

pub fn replace_words(dictionary: Vec<String>, sentence: String) -> String {
    //construct trie
    let mut trie_root = Trie::new();
    for dictionary_word in dictionary {
        trie_root.insert(dictionary_word);
    }

    //retrieve the trie
    sentence
        .split(" ")
        .map(|sentence_word| {
            trie_root.retrieve(sentence_word).unwrap_or(sentence_word.to_string())
        })
        .collect::<Vec<String>>()
        .join(" ")
}