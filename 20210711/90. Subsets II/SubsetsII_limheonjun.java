/**
 * Runtime: 4 ms, faster than 16.00% of Java online submissions for Subsets II.
 * Memory Usage: 39.1 MB, less than 79.77% of Java online submissions for Subsets II.
 */

class Solution {
    private int binary[];
    private int numbers[];
    private static final int ONE = 1;


    public List<List<Integer>> subsetsWithDup(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();
        int length = (int) Math.pow(2,nums.length);
        binary = new int[nums.length];
        numbers = nums;

        result.add(new ArrayList<>());

        for(int i=0; i<length-1; i++){
            plusOneToBinaryArray();
            List<Integer> integers = andOperation();
            result.add(integers);
        }

        return result.stream().distinct().collect(Collectors.toList());
    }

    /**
     * 모든 가능한 binary형태의 배열을 만듦
     * EX)
     * nums.length가 2일때
     * 2^2 = 4
     * {0,0}, {0,1}, {1,0}, {1,1}
     */
    private void plusOneToBinaryArray(){
        int carry = 1;
        int rest = 0;

        for(int i=binary.length-1; i>=0; i--){
            int sum = binary[i] + carry;
            rest = sum%2;
            carry = sum/2;
            binary[i] = rest;
            if(rest == 0 && carry == 0) break;
        }
    }

    /**
     * &(and) 연산을 통해 binary배열의 0인부분은 무시, 1인 부분만 결과값에 담기
     */
    private List<Integer> andOperation(){
        List<Integer> result = new ArrayList<>();
        int length = numbers.length;

        for(int i=0; i<length; i++){
            if(binary[i] == ONE) result.add(numbers[i]);
        }
        
        Collections.sort(result);
        return result;
    }
}