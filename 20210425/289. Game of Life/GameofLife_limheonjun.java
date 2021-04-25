/*
Runtime: 1 ms, faster than 20.92% of Java online submissions for Game of Life.
Memory Usage: 37.8 MB, less than 8.90% of Java online submissions for Game of Life.
*/
class Solution {
    public static final int LIVE_CELL = 1;
    public static final int DEAD_CELL = 0;
    int height;
    int width;
    int nextBoard[][];
    int currentBoard[][];

    public void gameOfLife(int[][] board) {
        height = board.length;
        width = board[0].length;
        currentBoard = board;
        nextBoard = new int[height][width];


        for(int m=0; m<height; m++) {
            for(int n=0; n<width; n++) {
                getNextBoard(m, n);
            }
        }
        
        deepCopy(nextBoard, board);
    }

    private void getNextBoard(int m, int n) {
        int direction[][] = {{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,1}, {1,-1}, {1,0}, {1,1}};
        int liveCells = 0;

        for(int i=0; i<8; i++) {
            int nextM = m + direction[i][0];
            int nextN = n + direction[i][1];

            if(!isWithinRange(nextM, nextN)) continue;
            if(isLiveCell(nextM, nextN)) liveCells++;
        }

        if(isSatisfyFirstCondition(m, n, liveCells)) nextBoard[m][n] = DEAD_CELL;
        else if(isSatisfySecondCondition(m, n, liveCells)) nextBoard[m][n] = LIVE_CELL;
        else if(isSatisfyThirdCondition(m, n, liveCells)) nextBoard[m][n] = DEAD_CELL;
        else if(isSatisfyForthCondition(m, n, liveCells)) nextBoard[m][n] = LIVE_CELL;
    }
    
    //1. 2개 미만의 live neighbors갖고 있는 live cell은 사망한다
    private boolean isSatisfyFirstCondition(int m, int n, int liveCells) {
        if(!isLiveCell(m, n)) return false;
        if(2 <= liveCells) return false;
        return true;
    }
    
    //2. 2개나 3개의 live neighbors갖고 있는 live cell은 살아남는다
    private boolean isSatisfySecondCondition(int m, int n, int liveCells) {
        if(!isLiveCell(m, n)) return false;
        if(liveCells != 2 && 3 != liveCells) return false;
        return true;
    }
    
    //3. 3개 이상의 live neighbors갖고 있는 live cell은 사망한다
    private boolean isSatisfyThirdCondition(int m, int n, int liveCells) {
        if(!isLiveCell(m, n)) return false;
        if(liveCells < 3) return false;
        return true;
    }

    //4. 정확히 3개의 live neighbors갖고 있는 dead cell은 살아난다
    private boolean isSatisfyForthCondition(int m, int n, int liveCells) {
        if(isLiveCell(m, n)) return false;
        if(liveCells != 3) return false;
        return true;
    }

    private boolean isLiveCell(int m, int n) {
        return currentBoard[m][n] == LIVE_CELL;
    }

    private boolean isWithinRange(int x, int y) {
        if(!(0 <= x && x < height)) return false;
        if(!(0 <= y && y < width)) return false;
        return true;
    }

    private void deepCopy(int[][] src, int dest[][]){
        for(int i=0; i<src.length; i++){
            System.arraycopy(src[i], 0, dest[i], 0, src[0].length);
        }
    }
}