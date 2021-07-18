use std::iter::Peekable;
use std::vec::IntoIter;

#[derive(Debug, PartialEq, Eq)]
pub enum NestedInteger {
    Int(i32),
    List(Vec<NestedInteger>)
}

pub struct NestedIterator {
    stack: Vec<NestedInteger>,
    next: Option<i32>
}

impl NestedIterator {
    pub fn new(nestedList: Vec<NestedInteger>) -> Self {
        let mut s = Self {
            stack: nestedList.into_iter().rev().collect::<Vec<NestedInteger>>(),
            next: None
        };
        s.unnest();
        s
    }

    pub fn next(&mut self) -> i32 {
        let result = self.next.unwrap();
        self.unnest();
        result
    }

    pub fn has_next(&mut self) -> bool {
        self.next.is_some()
    }

    fn unnest(&mut self) {
        while let Some(last) = self.stack.pop() {
            match last {
                NestedInteger::Int(n) => {
                    self.next = Some(n);
                    return;
                }
                NestedInteger::List(l) => {
                    self.stack.extend(l.into_iter().rev());
                }
            }
        }
        self.next = None;
    }
}

//new(): [[1,1],2,[1,1]] => [[1,1],2,[1,1]]
//pop(): after-> [[1,1],2,1,1] => [[1,1],2,1]/some(1)
//pop(): after-> [[1,1],2]/some(1)
//pop(): after-> [[1,1]]/some(2)
//pop(): after-> [1,1] => [1]/some(1)
//pop(): after-> [] => []/some(1)
