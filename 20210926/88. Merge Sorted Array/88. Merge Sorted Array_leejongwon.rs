impl Solution {
    pub fn merge(nums1: &mut Vec<i32>, mut m: i32, nums2: &mut Vec<i32>, mut n: i32) {
        for i in (0..nums1.len()).rev() {
            let a = nums1.get((m - 1) as usize).unwrap_or(&std::i32::MIN);
            let b = nums2.get((n - 1) as usize).unwrap_or(&std::i32::MIN);

            match a.cmp(b) {
                std::cmp::Ordering::Greater => {
                    nums1[i] = *a;
                    m -= 1
                },
                _ => {
                    nums1[i] = *b;
                    n -= 1
                }
            }
        }
    }
}

// a: 3, b: 6, nums1: [1, 2, 3, 0, 0, *6*]
// a: 3, b: 5, nums1: [1, 2, 3, 0, *5*, 6]
// a: 3, b: 2, nums1: [1, 2, 3, *3*, 5, 6]
// a: 2, b: 2, nums1: [1, 2, *2*, 3, 5, 6]
// a: 2, b: -2147483648, nums1: [1, *2*, 2, 3, 5, 6]
// a: 1, b: -2147483648, nums1: [*1*, 2, 2, 3, 5, 6]