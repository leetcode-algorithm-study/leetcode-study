/*
    Runtime: 7 ms
    Memory Usage: 44.8 MB
*/
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int maxHeight = matrix.length;
        int height = 0;

        while(height < maxHeight){
            if(find(matrix[height], target)) return true;
            else height++;
        }
        return false;
    }

    public boolean find(int arr[], int target){
        int start = 0;
        int end = arr.length-1;

        while(end>start){
            int mid = (start+end)/2;
            if(arr[mid] < target) start = mid+1;
            else end=mid;
        }

        return arr[end] == target;
    }
}