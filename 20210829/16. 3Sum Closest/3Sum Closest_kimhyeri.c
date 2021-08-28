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

// two pointer 쓸려면 첫 번째 for loop를 제외한
// j,k루프에서 for loop대신 j = i + 1, k = numsSize - 1로 가져가면 된다.
// i를 제외하고 나머지 pointer로 gap을 비교하고 sum에 넣어주는 방식으로 가면 된다.
// while조건문은 j > k 여야하고 gap이 작으면 sum에 넣어주고 result = res넣고
// gap이 0보다 작으면 j를 올려주고 0보다 크면 k를 올려주고
// (위가 가능한게 처음에 qsort써서 ㄱㅊ)

