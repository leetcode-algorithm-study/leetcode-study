int removeDuplicates(int* nums, int numsSize){
    if(numsSize <= 1) {
        return numsSize;
    }
    
    int i = 1;
    int k = 1;
    
    for(i; i < numsSize; i++) {
        if(nums[i] != nums[i - 1]) {
            nums[k] = nums[i];
            k++;
        }
    }
    
    return k;
}
