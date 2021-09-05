/**
 * 1. 기준이 될 인덱스 설정(i)
 * 2. 기준이 되는 인덱스+1(low)와 맨 마지막 인덱스(high)를 투포인터로 탐색
 * 3. sum이 target보다 큰 경우 target에 가까워지기 위해선 합이 작아져야함 => high 감소
 * 4. sum이 target보다 작은 경우 target에 가까워지기 위해선 합이 커져야함 => low 증가
 * 5. low는 high보다 작아야함. 중복된 값을 찾거나 범위를 벗어나는것을 막기 위해
 */
class Solution {
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int diff = Integer.MAX_VALUE;
        int output = 0;
        for(int i = 0; i < nums.length - 2; i++){
            int low = i + 1;
            int high = nums.length - 1;

            while(low < high){
                int sum = nums[i] + nums[low] + nums[high];

                if(Math.abs(target - sum) < diff){
                    diff = Math.abs(target - sum);
                    output = sum;
                }

                if(sum > target) high--;
                else low++;
            }
        }
        return output;
    }
}