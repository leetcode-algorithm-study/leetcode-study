enum Direction {
    Right,
    Down,
    Left,
    Up,
    INIT,
}

impl Direction {
    fn turn(&mut self) {
        match self {
            Self::INIT => *self = Self::Right,
            Self::Right => *self = Self::Down,
            Self::Down => *self = Self::Left,
            Self::Left => *self = Self::Up,
            Self::Up => *self = Self::Right,
        }
    }

    fn progress(&mut self, x: &mut i32, y: &mut i32) {
        match self {
            Self::Right => *x += 1,
            Self::Down => *y -= 1,
            Self::Left => *x -= 1,
            Self::Up => *y += 1,
            Self::INIT => self.turn(),
        }
    }
}

impl Solution {
    pub fn generate_matrix(n: i32) -> Vec<Vec<i32>> {
        let mut spiral_matrix: Vec<Vec<i32>> = Vec::with_capacity(n as usize);
        spiral_matrix.extend(vec![vec![0; n as usize]; n as usize]);


        let mut point = (0 as i32, 0 as i32);
        let mut direction = Direction::INIT;
        let mut distance = n;
        let mut value = 0;

        while distance > 0 {
            for _ in 0..distance {
                value += 1;
                direction.progress(&mut point.0, &mut point.1);
                spiral_matrix[point.1.abs() as usize][point.0.abs() as usize] = value as i32;
            }

            match direction {
                Direction::Right | Direction::Left => { distance -= 1; }
                _ => {}
            }
            direction.turn();
        }

        spiral_matrix
    }
}


// 1(0,0)  2(1,0)  3(2,0)
// 8(0,-1) 9(1,-1) 4(2,-1)
// 7(0,-2) 6(1,-2) 5(2,-2)

//7(0,2) 6(1,2) 5(2,2)
//8(0,1) 9(1,1) 4(2,1)
//1(0,0) 2(1,0) 3(2,0)

//가는 횟수. 4, 3, 3, 2, 2, 1, 1