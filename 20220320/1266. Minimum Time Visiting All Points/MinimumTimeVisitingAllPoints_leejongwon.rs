use std::cmp;


impl Solution {
    pub fn min_time_to_visit_all_points(points: Vec<Vec<i32>>) -> i32 {
        let mut res = 0;

        for i in 1..points.len() {
            let x_dir = points[i][0] - points[i-1][0];
            let y_dir = points[i][1] - points[i-1][1];
            res += cmp::max(x_dir.abs(), y_dir.abs());
        }

        // i32::abs(ans_x) + i32::abs(ans_y)
        res
    }
}
