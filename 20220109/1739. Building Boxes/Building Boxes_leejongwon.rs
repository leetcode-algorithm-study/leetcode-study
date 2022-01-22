impl Solution {
    pub fn minimum_boxes(n: i32) -> i32 {
        // 상자 x를 y 위에 놓기 위해서 y 의 모든 면은 벽과 다른 상자에 인접해야함(구석에 쌓으면 두 면이 벽과 인접)
        // 단, 조건에 맞는 상자는 쌓는 과정에서 먼저 올려야함(1층 상자 최소 개수 리턴)

        let mut delta = 0;
        let mut curr = 0;
        let mut acc = 0;
        while n > acc
        {
            delta += 1;
            curr += delta;
            acc += curr;
        }
        // if (acc - n > 0 && curr - delta > acc - n) // 남은게 있을 경우에 위에 쌓는 경우 고려
        // {
        //     curr -= 1;
        // }
        while acc >= n
        {
            // println!("called by acc: {}, n: {}", acc, n);
            curr -= 1;
            acc -= delta;
            delta -= 1;
        }

        curr + 1
    }
}