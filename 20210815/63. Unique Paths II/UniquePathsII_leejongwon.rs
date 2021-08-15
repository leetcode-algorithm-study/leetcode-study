impl Solution {
    pub fn unique_paths_with_obstacles(obstacle_grid: Vec<Vec<i32>>) -> i32 {
        if obstacle_grid.len() == 0 {
            return 0;
        }

        //
        let mut acc = vec![0; obstacle_grid[0].len()];
        acc[0] = 1;

        //
        for row in &obstacle_grid {
            for (i, &value) in row.iter().enumerate() {
                if i > 0 {
                    acc[i] = acc[i] + acc[i - 1];
                }
                if value == 1 {
                    acc[i] = 0;
                }
            }
        }

        acc[obstacle_grid[0].len() - 1]
    }
}