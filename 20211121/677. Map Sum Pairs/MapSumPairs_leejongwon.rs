use std::collections::HashMap;

#[derive(Default)]
struct Trie {
    children: [Option<Box<Trie>>; 26],
    sum: i32
}

#[derive(Default)]
struct MapSum {
    trie: Trie,
    values: HashMap<String, i32>,
}

impl MapSum {

    fn new() -> Self {
        Default::default()
    }

    fn insert(&mut self, key: String, val: i32) {
        let mut trie = &mut self.trie;

        let map_sum_values = self.values.get(&key).unwrap_or(&0);
        let delta = val - map_sum_values;
        trie.sum += delta;

        for char in key.chars() {
            let index = (char as u8 - 'a' as u8) as usize;
            trie = trie.children[index].get_or_insert(Box::new(Trie::default()));
            trie.sum += delta;
        }

        self.values.insert(key, val);
    }

    fn sum(&self, prefix: String) -> i32 {
        let mut node = &self.trie;
        for char in prefix.chars() {
            let index = (char as u8 - 'a' as u8) as usize;
            match &node.children[index] {
                Some(n) => {
                    node = n;
                }
                None => {
                    return 0;
                }
            }
        }
        node.sum
    }
}
