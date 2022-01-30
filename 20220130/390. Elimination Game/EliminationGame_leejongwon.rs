impl Solution {
    pub fn last_remaining(mut n: i32) -> i32 {
        let mut first = 1;
        let mut round = 0;

        // 한개 남을때까지 왼쪽/오른쪽 규칙 적용. 
        // 1) 왼쪽 방향일땐 무조건 2배 증가
        // 2) 오른쪽 방향일땐 n이 홀수 일때만 2배 증가(1개가 남아서 사라지기 때문)
        while n > 1 {
            // is left || is right && n.is_odd
            if round % 2 == 0 || (round % 2 == 1 && n % 2 == 1) {
                first += (1 << round);
            }

            round += 1;
            n = n / 2;
        }

        return first;
    }
}