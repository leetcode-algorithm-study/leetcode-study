class Solution {
private:
	int dirR[4] = { 0,0,-1,1 };
	int dirC[4] = { -1,1,0,0 };

	void checkNormalWord(vector<vector<char>> board, vector<string> words, vector<string>& matchedWords, vector<bool>& foundWords, vector<vector<bool>> trace, int k, int idx, int r, int c) {
		if (foundWords[k])	return;
		if (idx >= words[k].size())
		{
			matchedWords.push_back(words[k]);
			foundWords[k] = true;
			return;
		}

		trace[r][c] = true;

		for (int i = 0; i < 4; i++)
		{
			int nextR = r + dirR[i];
			int nextC = c + dirC[i];
			if (nextR >= 0 && nextR < board.size() && nextC >= 0 && nextC < board[0].size())
			{
				if (words[k][idx] == board[nextR][nextC] && !trace[nextR][nextC])
				{
					checkNormalWord(board, words, matchedWords, foundWords, trace, k, idx + 1, nextR, nextC);
				}
			}
		}
	}
public:
	vector<string> findWords(vector<vector<char>>& board, vector<string>& words) {
		vector<string> matchedWords;
		int numWord = words.size();
		int rSize = board.size();
		int cSize = board[0].size();
		vector<bool> foundWords(numWord, false);
		vector<vector<bool>> trace(rSize,vector<bool>(cSize,false));
		for (int k = 0; k < numWord; k++)
		{
			for (int i = 0; i < rSize; i++)
			{
				for (int j = 0; j < cSize; j++)
				{
					if (words[k][0] == board[i][j] && !foundWords[k])
					{
						checkNormalWord(board, words, matchedWords, foundWords, trace, k, 1, i, j);
					}
				}
			}
		}
		return matchedWords;
	}
};

//Runtime: 0 ms, faster than 100.00 % of C++ online submissions for Word Search II.
//Memory Usage : 10.8 MB, less than 9.16 % of C++ online submissions for Word Search II.