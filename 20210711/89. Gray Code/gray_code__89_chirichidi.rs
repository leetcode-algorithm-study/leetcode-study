pub fn gray_code(n: i32) -> Vec<i32> {
    let mut result = vec![0_i32; 2_usize.pow(n as u32)];

    for num in 0..result.len() {
        result[num] = (num ^ (num >> 1)) as i32;
    }
    result
}