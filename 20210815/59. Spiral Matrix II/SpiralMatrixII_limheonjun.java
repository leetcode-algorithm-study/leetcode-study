class Solution {
    public int[][] generateMatrix(int n) {
        int matrix[][] = new int[n][n];
        int rowMin = 0;
        int colMin = 0;
        int rowMax = n;
        int colMax = n;
        int row = 0;
        int col = 0;
        int count = 1;
        int pow = (int) Math.pow(n,2);

        while(count <= pow){
            //while문이 끝나면 첫번째 row는 채워져 있기 때문에 rowMin은 1 증가해야함
            while(col < colMax){
                matrix[row][col++] = count++;
            }
            col--;
            row++;
            rowMin++;

            //while문이 끝나면 마지막 col은 채워져 있기 때문에 colMax는 1 감소해야함
            while(row < rowMax){
                matrix[row++][col] = count++;
            }
            row--;
            col--;
            colMax--;

            //while문이 끝나면 마지막 row는 채워져 있기 때문에 rowMax는 1 감소해야함
            while(col >= colMin){
                matrix[row][col--] = count++;
            }
            col++;
            row--;
            rowMax--;

            //while문이 끝나면 첫번째 col이 채워져 있기 때문에 colMin은 1 증가해야함
            while(row >= rowMin){
                matrix[row--][col] = count++;
            }
            row++;
            col++;
            colMin++;
        }


        return matrix;
    }
}