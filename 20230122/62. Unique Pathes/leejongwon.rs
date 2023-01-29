impl Solution {
    pub fn unique_paths(m: i32, n: i32) -> i32 {

        let mut acc = vec![vec![0; n as usize]; m as usize];
        acc[0][0] = 1;

        for i in 0..m {
            for j in 0..n {
                let mut top_acc = 0;
                if i > 0 {
                    top_acc = acc[(i-1) as usize][j as usize];
                }

                let mut left_acc = 0;
                if j > 0 {
                    left_acc = acc[i as usize][(j-1) as usize]
                }

                acc[i as usize][j as usize] += (top_acc + left_acc) as usize
            }
        }

        acc[(m-1) as usize][(n-1) as usize] as i32
    }
}