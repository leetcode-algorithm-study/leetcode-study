class Solution {
public:
    void solve(vector<vector<char>>& board) {
        if( board.size() == 0 || board[0].size() == 0 ) return;
        for( int i = 0; i < board.size(); ++i ) {
            if( board[i][0] == 'O' ) contageV(i, 0, board);
            if( board[i][board.size() - 1] == 'O' ) contageV(i, board.size() - 1, board);
        }
        
        for( int j = 0; j < board[0].size(); ++j ) {
            if( board[0][j] == 'O' ) contageV(0, j, board);
            if( board[board[0].size() - 1][j] == 'O' ) contageV(board[0].size() - 1, j, board);
        }
        
        for( int i = 0; i < board.size(); ++i ) {
            for( int j = 0; j < board[0].size(); ++j ) {
                if( board[i][j] == 'V' ) board[i][j] = 'O';
                else if( board[i][j] == 'O' ) board[i][j] = 'X';
            }
        }
    }
    
    void contageV( int i, int j, vector<vector<char>>& board) {
        board[i][j] = 'V';
        if( i > 0 && board[i - 1][j] == 'O' ) contageV(i - 1, j, board);
        if( j > 0 && board[i][j - 1] == 'O' ) contageV(i, j - 1, board);
        if( i < board.size() - 1 && board[i + 1][j] == 'O' ) contageV(i + 1, j, board);
        if( j < board[0].size() - 1 && board[i][j + 1] == 'O' ) contageV(i, j + 1, board);
    }
};
