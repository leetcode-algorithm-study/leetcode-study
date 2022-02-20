use std::collections::{HashMap, BinaryHeap};
use std::cmp::Ordering;


#[derive(Copy, Clone, Eq, PartialEq)]
struct State {
    cost: i32,
    curr: i32,
    stop: i32,
}

impl Ord for State {
    fn cmp(&self, other: &Self) -> Ordering {
        other.cost.cmp(&self.cost) //sort by cost
    }
}

impl PartialOrd for State {
    fn partial_cmp(&self, other: &State) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl State {
    #[inline]
    fn new(cost: i32, curr: i32, stop: i32) -> State {
        State {
            cost,
            curr,
            stop,
        }
    }
}

impl Solution {
    pub fn find_cheapest_price(n: i32, flights: Vec<Vec<i32>>, src: i32, dst: i32, k: i32) -> i32 {

        //build graph (from, to, price)
        // ex) [[0,1,100],[1,2,100],[0,2,500]]
        // => {0 => [1,100]}, {1 => [2,100]}, {0 => {2,500}}  {from => [to, price]}
        let mut prices = HashMap::<i32, Vec<(i32, i32)>>::new();
        for f in flights {
            let from = f[0];
            let to_price = (f[1], f[2]);
            match prices.get_mut(&from) {
                Some(v) => { v.push(to_price); }
                None => { prices.insert(from, vec![to_price]); }
            }
        }

        let mut heap = BinaryHeap::new();
        heap.push(State::new(0, src, k + 1));  //acc_cost, curr, stop / (0, 0, 3)

        let mut been = HashMap::<i32, Vec<(i32, i32)>>::new();

        while let Some(s) = heap.pop() {
            let cost = s.cost; //(acc)0 -> 100(0+100) -> 200(100+100)
            let curr = s.curr; //0 -> 1 -> 2
            let stop = s.stop; //3 -> 2 -> 1

            if been.contains_key(&curr) == true {
                if let (c, s) = been.get(&curr).unwrap().get(0).unwrap() {
                    //Skip if there is a path that reached the current node with better conditions
                    if c < &cost && s > &stop {
                        continue;
                    }
                }
            }
            been.insert(curr, vec![(cost, stop)]); // {0 => [0, 3]} -> {1 => [100, 2]} -> {2 => [200, 1]}

            if curr == dst {
                return cost
            };

            if stop > 0 {
                match prices.get(&curr) {
                    None => {
                        continue;
                    },
                    Some(v) => {
                        for &(d, c) in v {
                            heap.push(State::new(cost + c, d, stop - 1))
                        }
                    }
                }
            }
        }

        -1
    }
}
