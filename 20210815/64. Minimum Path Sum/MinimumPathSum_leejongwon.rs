impl Solution {
    pub fn min_path_sum(grid: Vec<Vec<i32>>) -> i32 {
        if grid.is_empty() {
            return 0;
        }

        let mut grid_acc = grid;
        let (m, n) = (grid_acc.len(), grid_acc[0].len());

        for i in 0..m {
            for j in 0..n {
                match (i, j) {
                    (0, 0) => continue,
                    (0, _) => grid_acc[i][j] += grid_acc[i][j-1],
                    (_, 0) => grid_acc[i][j] += grid_acc[i-1][j],
                    (_, _) => grid_acc[i][j] += grid_acc[i][j-1].min(grid_acc[i-1][j])
                }
            }
        }
        grid_acc[m-1][n-1]
    }
}