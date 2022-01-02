pub fn int_to_roman(mut num: i32) -> String {
	let roman_numbers = vec![
		("I", 1),
		("IV", 4),
		("V", 5),
		("IX", 9),
		("X", 10),
		("XL", 40),
		("L", 50),
		("XC", 90),
		("C", 100),
		("CD", 400),
		("D", 500),
		("CM", 900),
		("M", 1000),
	];

	let mut result = String::new();
	for (roman, value) in roman_numbers.into_iter().rev() {
		while num >= value {
			num -= value;
			result.push_str(roman);
		}
	}

	result
}