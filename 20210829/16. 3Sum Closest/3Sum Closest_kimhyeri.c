//
//  3Sum Closest.c
//  Leetcode_c
//
//  Created by ELLIE on 2021/08/29.
//

#include <stdio.h>
#include <limits.h>
#include <stdlib.h>

int compare(const void *a, const void *b)    // 오름차순 비교 함수 구현
{
    int num1 = *(int *)a;    // void 포인터를 int 포인터로 변환한 뒤 역참조하여 값을 가져옴
    int num2 = *(int *)b;    // void 포인터를 int 포인터로 변환한 뒤 역참조하여 값을 가져옴

    if (num1 < num2)    // a가 b보다 작을 때는
        return -1;      // -1 반환
    
    if (num1 > num2)    // a가 b보다 클 때는
        return 1;       // 1 반환
    
    return 0;    // a와 b가 같을 때는 0 반환
}

int threeSumClosest(int* nums, int numsSize, int target) {
    int i = 0;
    int j = 0;
    int k = 0;
    int res = 0;
    int result = 0;
    int sum = INT_MAX;
    
    qsort(nums, numsSize, sizeof(int), compare);

    for(i = 0; i < numsSize; i++){
        for(j = i+1; j < numsSize; j++){
            for(k = j+1; k < numsSize; k++){
                res = nums[i] + nums[j] + nums[k];
                if((abs(res - target)) < sum){
                    sum = abs(res - target);
                    result = res;
                }
            }
        }
    }
    
    return result;
}
