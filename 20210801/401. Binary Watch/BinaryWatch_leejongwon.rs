impl Solution {
    pub fn read_binary_watch(turned_on: i32) -> Vec<String> {
        let mut res = vec![];

        for h in 0..12 {
            for m in 0..60 {
                let v = h * 64 + m as i32;
                if v.count_ones() == turned_on as u32 {
                    res.push(format!("{}:{:02}", h, m));
                }
            }
        }
        res
    }
}


// 시/분 표현 방식(2진)
// 0000    00000
// 8/4/2/1 32/16/8/4/2/1
// => 10진수 변환으로 한번에 나타내려면 h * 2^6 + m
// => n>=6 인 2^n 이면 다 상관없음. 2진 자리수만 늘을뿐 1개수에는 영향을 안주니까
//
// PM flag..?
