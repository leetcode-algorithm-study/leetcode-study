use std::cmp::Reverse;

impl Solution {
    pub fn reconstruct_queue(mut people: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut queue = Vec::with_capacity(people.len());

        // transfer data(before)
        //  [7,0]
        //  [4,4]
        //  [7,1]
        //  [5,0]
        //  [6,1]
        //  [5,2]
        people.sort_by_key(|p| {
            (Reverse(p[0]), p[1])
        });
        // transfer data(after)
        //  [7,0]
        //  [7,1]
        //  [6,1]
        //  [5,0]
        //  [5,2]
        //  [4,4]

        // greedy: insert to queue by rank(=queue index)
        for person in people.iter() {
            queue.insert(person[1] as usize, person.to_vec());
        }
        //   0       1       2       3       4       5
        // *(7,0)*
        // (7,0)  *(7,1)*
        // (7,0)  *(6,1)*  (7,1)
        // *(5,0)* (7,0)   (6,1)   (7,1)
        // (5,0)   (7,0)  *(5,2)*  (6,1)   (7,1)
        // (5,0)   (7,0)   (5,2)   (6,1)  *(4,4)*  (7,1)

        queue
    }
}
