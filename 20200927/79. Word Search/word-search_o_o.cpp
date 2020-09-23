struct Position {
    int x;
    int y;
};

bool operator == (const Position& lhs, const Position& rhs)
{
    return lhs.x == rhs.x && lhs.y == rhs.y;
}

class Solution {
    
public:
    bool exist(vector<vector<char>>& board, string word) {
        for( auto x = 0; x < board[0].size(); ++x ) 
            for( auto y = 0; y < board.size(); ++y ) {
                vector<Position> trace = {{x, y}};
                if( board[y][x] == word[0] && exist(board, word, 1, trace) ) 
                    return true;
            }
        return false;
    }
    
    bool exist(vector<vector<char>>& board, string word, int index, vector<Position>& trace) {
        if( index == word.length() ) return true;
        auto neighbors = this->findNeighbor(word[index], board, trace.back());
        for(auto& neighbor : neighbors) {
            if( std::find(trace.rbegin(), trace.rend(), neighbor) != trace.rend() ) continue;
            trace.push_back(neighbor);
            if( exist(board, word, index + 1, trace) ) return true;
            trace.pop_back();
        }
        return false;
    }
    
    vector<Position> findNeighbor(const char& target, const vector<vector<char>>& board, Position pos) {
        vector<Position> ret;
        if(pos.x != 0 && board[pos.y][pos.x - 1] == target )
            ret.push_back({pos.x - 1, pos.y});
        if(pos.x != board[0].size() - 1 && board[pos.y][pos.x + 1] == target )
            ret.push_back({pos.x + 1, pos.y});
        if(pos.y != 0 && board[pos.y - 1][pos.x] == target )
            ret.push_back({pos.x, pos.y - 1});
        if(pos.y != board.size() - 1 && board[pos.y + 1][pos.x] == target )
            ret.push_back({pos.x, pos.y + 1});
        
        return ret;
    }
};
// Runtime: 364 ms, faster than 21.17% of C++ online submissions for Word Search.
// Memory Usage: 39.9 MB, less than 43.98% of C++ online submissions for Word Search.