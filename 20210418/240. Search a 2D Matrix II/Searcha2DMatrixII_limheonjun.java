/*
    Runtime: 314 ms
    Memory Usage: 45.9 MB
*/
class Solution {
    
    int direction[][] = {{0,1}, {0,-1}, {1,0}, {-1,0}}; //상하좌우
    boolean visited[][];
    int height;
    int width;
    boolean find = false;
    
    public boolean searchMatrix(int[][] matrix, int target) {
        height = matrix.length;
        width = matrix[0].length;
        visited = new boolean[height][width];

        for(int y=0; y<height; y++) {
            for(int x=0; x<width; x++) {
                if(!visited[y][x]) dfs(x, y, target, matrix);
            }
        }

        return find;
    }

    private void dfs(int x, int y, int target, int matrix[][]) {
        visited[y][x] = true;
        if(matrix[y][x] == target) {
            find = true;
            return;
        }
        //4방향
        for(int i=0; i<4; i++){
            int nextY = direction[i][1] + x;
            int nextX = direction[i][0] + y;

            if(nextX < 0 || width <= nextX) continue;
            if(nextY < 0 || height <= nextY) continue;
            if(visited[nextY][nextX]) continue;
            dfs(nextX, nextY, target, matrix);
        }
    }
}