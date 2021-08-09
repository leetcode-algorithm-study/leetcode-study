class Solution {
    private int dp[][];
    private int width;
    private int height;

    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        height = obstacleGrid.length;
        width = obstacleGrid[0].length;
        dp = new int[height][width];

        for(int i=0; i<height; i++){
            if(obstacleGrid[i][0] == 1) break;
            dp[i][0] = 1;
        }

        for(int i=0; i<width; i++){
            if(obstacleGrid[0][i] == 1) break;
            dp[0][i] = 1;
        }


        for(int i=1; i<height; i++){
            for(int j=1; j<width; j++){
                if(obstacleGrid[i][j] == 1) continue;
                dp[i][j] = dp[i][j-1] + dp[i-1][j];
            }
        }

        return dp[height-1][width-1];
    }
}