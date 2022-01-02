impl Solution {
    pub fn get_permutation(n: i32, k: i32) -> String {
        let mut answer = String::with_capacity(n as usize);
        let mut v: Vec<char> = (0..n as u8).map(|i| (b'1' + i) as char).collect();
        let mut k = k - 1; //Searching kth index from vector
        let mut floating_count: i32 = (1..n).product(); // *Each nth element has the cases of (n-1)!

        //주어진 k 인덱스와 순열의 팩토리얼 경우의 수를 이용해 찾고자 하는 정답을 한자리씩 fix
        for fixed in 1..n {
            let index = (k / floating_count) as usize;
            let value = v.remove(index);
            // println!("k: {}, factorial: {}, index: {}, value: {}", k, floating_count, index, value);

            answer.push(value);
            k = k % floating_count; //calc next searching forward index
            floating_count = floating_count / (n - fixed);  // (n-fixed)!
        }

        answer.push(v[0]); //남는 숫자 처리
        answer
    }
}