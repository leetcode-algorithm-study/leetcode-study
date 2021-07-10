use std::collections::{HashMap, HashSet};

#[allow(non_camel_case_types)]
pub fn subsets_with_dup(nums: Vec<i32>) -> Vec<Vec<i32>> {
    let mut hSet: HashSet<Vec<i32>> = HashSet::new();
    hSet.insert(vec![]);

    for num in nums {
        let mut newSub = vec![];

        for item in &hSet {
            let mut cloned = item.clone();
            cloned.push(num);
            cloned.sort();
            // hSet.insert(cloned.clone());
            newSub.push(cloned);
        }

        for sub in newSub {
            hSet.insert(sub);
        }
    }

    let mut result = vec![];
    result.extend(hSet.into_iter());
    result
}