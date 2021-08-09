class Solution {
    private int dp[][];
    private int width;
    private int height;

    public int minPathSum(int[][] grid) {
        height = grid.length;
        width = grid[0].length;
        dp = new int[height][width];

        for(int i=0; i<height; i++){
            for(int j=0; j<width; j++){
                int left = Integer.MAX_VALUE;
                int up = Integer.MAX_VALUE;

                if(isValidLeft(i,j)) left = grid[i][j] + dp[i][j-1];
                if(isValidUp(i,j)) up = grid[i][j] + dp[i-1][j];

                dp[i][j] = left == Integer.MAX_VALUE && up == Integer.MAX_VALUE ?
                        grid[i][j]
                        :
                        Math.min(left, up);
            }
        }

        return dp[height-1][width-1];
    }

    //현재 좌표의 왼쪽이 유효한지
    private boolean isValidLeft(int row, int col){
        return row >= 0 && col-1 >= 0;
    }

    //현재 좌표의 위쪽이 유효한지
    private boolean isValidUp(int row, int col){
        return row-1 >= 0 && col >= 0;
    }
}