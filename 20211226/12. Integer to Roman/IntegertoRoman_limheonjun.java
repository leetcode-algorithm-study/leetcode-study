class Solution {
    public String intToRoman(int num) {
		int value[] =     {1000, 900,  500,  400,  100,   90,   50,   40,   10,   9,   5,  4,  1};
		String symbol[] = {"M",  "CM", "D",  "CD", "C",  "XC",  "L",  "XL", "X", "IX","V","IV","I"};
		StringBuilder sb = new StringBuilder();

		for(int i=0; i<value.length; i++) {
			if(num < value[i]) continue;
			int mok = num / value[i];

			for(int j=mok; j>0; j--) {
				sb.append(symbol[i]);
			}

			num = num % value[i];
		}

		return sb.toString();
    }
}