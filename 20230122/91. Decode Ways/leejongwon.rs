impl Solution {
    pub fn num_decodings(s: String) -> i32 {
        if s.as_bytes()[0] == b'0' {
            return 0;
        }

        let mut dp = [1; 3];
        for win in s.as_bytes().windows(2) {
            let first = win[0];
            let second = win[1];

            dp[0] = dp[1];
            dp[1] = dp[2];
            dp[2] = match first {
                b'1' => match second {
                    b'0' => dp[0],
                    _ => dp[0] + dp[1],
                }
                b'2' => match second {
                    b'0' => dp[0],
                    b'1'..=b'6' => dp[0] + dp[1],
                    _ => dp[1],
                }
                _ => match second {
                    b'0' => return 0,
                    _ => dp[1],
                }
            };
        }
        dp[2]
    }
}